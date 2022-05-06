# typed: strict

module KubeDSL
  module DSL
    module Apps
      module V1
        class ReplicaSetList < ::KubeDSL::DSLObject
          array_field(:item) { KubeDSL::DSL::Apps::V1::ReplicaSet.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

          validates :items, array: { kind_of: KubeDSL::DSL::Apps::V1::ReplicaSet }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "apps/v1"
              result[:items] = items.map(&:serialize)
              result[:kind] = "ReplicaSetList"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :replica_set_list
          end
        end
      end
    end
  end
end