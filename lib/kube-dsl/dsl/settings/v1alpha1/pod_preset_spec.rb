module KubeDSL::DSL::Settings::V1alpha1
  class PodPresetSpec < ::KubeDSL::DSLObject
    array_field(:env) { KubeDSL::DSL::V1::EnvVar.new }
    array_field(:env_from) { KubeDSL::DSL::V1::EnvFromSource.new }
    object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
    array_field(:volume_mount) { KubeDSL::DSL::V1::VolumeMount.new }
    array_field(:volume) { KubeDSL::DSL::V1::Volume.new }

    validates :envs, array: { kind_of: KubeDSL::DSL::V1::EnvVar }, presence: false
    validates :env_froms, array: { kind_of: KubeDSL::DSL::V1::EnvFromSource }, presence: false
    validates :selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
    validates :volume_mounts, array: { kind_of: KubeDSL::DSL::V1::VolumeMount }, presence: false
    validates :volumes, array: { kind_of: KubeDSL::DSL::V1::Volume }, presence: false

    def serialize
      {}.tap do |result|
        result[:env] = envs.map(&:serialize)
        result[:envFrom] = env_froms.map(&:serialize)
        result[:selector] = selector.serialize
        result[:volumeMounts] = volume_mounts.map(&:serialize)
        result[:volumes] = volumes.map(&:serialize)
      end
    end

    def kind_sym
      :pod_preset_spec
    end
  end
end
