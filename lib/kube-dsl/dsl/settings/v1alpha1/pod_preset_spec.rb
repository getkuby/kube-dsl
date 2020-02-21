module KubeDSL::DSL::Settings::V1alpha1
  class PodPresetSpec
    extend ::KubeDSL::ValueFields

    array_field(:env) { KubeDSL::DSL::V1::EnvVar.new }
    array_field(:env_from) { KubeDSL::DSL::V1::EnvFromSource.new }
    array_field(:volume_mount) { KubeDSL::DSL::V1::VolumeMount.new }
    array_field(:volume) { KubeDSL::DSL::V1::Volume.new }
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:env] = envs.map(&:serialize)
        result[:envFrom] = env_froms.map(&:serialize)
        result[:volumeMounts] = volume_mounts.map(&:serialize)
        result[:volumes] = volumes.map(&:serialize)
        result[:selector] = selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :pod_preset_spec
    end
  end
end
