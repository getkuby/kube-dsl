# typed: strict

module KubeDSL
  module DSL
    module V1
      class PersistentVolumeList < ::KubeDSL::DSLObject
        array_field(:item) { KubeDSL::DSL::V1::PersistentVolume.new }
        object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

        validates :items, array: { kind_of: KubeDSL::DSL::V1::PersistentVolume }, presence: false
        validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

        def serialize
          {}.tap do |result|
            result[:apiVersion] = "v1"
            result[:items] = items.map(&:serialize)
            result[:kind] = "PersistentVolumeList"
            result[:metadata] = metadata.serialize
          end
        end

        def kind_sym
          :persistent_volume_list
        end
      end
    end
  end
end