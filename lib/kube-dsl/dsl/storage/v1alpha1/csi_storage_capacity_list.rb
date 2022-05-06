# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1alpha1
        class CSIStorageCapacityList < ::KubeDSL::DSLObject
          array_field(:item) { KubeDSL::DSL::Storage::V1alpha1::CSIStorageCapacity.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

          validates :items, array: { kind_of: KubeDSL::DSL::Storage::V1alpha1::CSIStorageCapacity }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "storage.k8s.io/v1alpha1"
              result[:items] = items.map(&:serialize)
              result[:kind] = "CSIStorageCapacityList"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :csi_storage_capacity_list
          end
        end
      end
    end
  end
end