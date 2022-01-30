# typed: true

module KubeDSL::DSL::Settings::V1alpha1
  class PodPreset < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Settings::V1alpha1::PodPresetSpec.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Settings::V1alpha1::PodPresetSpec }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "settings.k8s.io/v1alpha1"
        result[:kind] = "PodPreset"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :pod_preset
    end
  end
end
