module KubeDSL::DSL::Settings
  class PodPresetList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::Settings::PodPreset.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "settings.k8s.io/v1alpha1"
        result[:kind] = "PodPresetList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
