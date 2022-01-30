# typed: true

module KubeDSL::DSL::Settings::V1alpha1
  class PodPresetList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Settings::V1alpha1::PodPreset.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Settings::V1alpha1::PodPreset }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "settings.k8s.io/v1alpha1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "PodPresetList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :pod_preset_list
    end
  end
end
