module KubeDSL::DSL::Settings
  class PodPreset
    extend ::KubeDSL::ValueFields
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Settings::PodPresetSpec.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "settings.k8s.io/v1alpha1"
        result[:kind] = "PodPreset"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
