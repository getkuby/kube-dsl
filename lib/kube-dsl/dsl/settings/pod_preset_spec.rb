module KubeDSL::DSL::Settings
  class PodPresetSpec
    extend ::KubeDSL::ValueFields
    array_field(:env) { KubeDSL::DSL::EnvVar.new }
    array_field(:env_from) { KubeDSL::DSL::EnvFromSource.new }
    array_field(:volume_mount) { KubeDSL::DSL::VolumeMount.new }
    array_field(:volume) { KubeDSL::DSL::Volume.new }
    object_field(:selector) { KubeDSL::DSL::Meta::LabelSelector.new }

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
  end
end
