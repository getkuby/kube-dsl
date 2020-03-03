module KubeDSL::DSL::Settings::V1alpha1
  class PodPresetList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Settings::V1alpha1::PodPreset.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "settings.k8s.io/v1alpha1"
        result[:kind] = "PodPresetList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :pod_preset_list
    end
  end
end
