# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1
        class CSINodeList < ::KubeDSL::DSLObject
          array_field(:item) { KubeDSL::DSL::Storage::V1::CSINode.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

          validates :items, array: { kind_of: KubeDSL::DSL::Storage::V1::CSINode }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "storage.k8s.io/v1"
              result[:items] = items.map(&:serialize)
              result[:kind] = "CSINodeList"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :csi_node_list
          end
        end
      end
    end
  end
end