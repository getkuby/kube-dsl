# typed: true

module KubeDSL
  module DSL
    module Apps
      module V1
        class StatefulSetList < ::KubeDSL::DSLObject
          array_field(:item) { KubeDSL::DSL::Apps::V1::StatefulSet.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

          validates :items, array: { kind_of: KubeDSL::DSL::Apps::V1::StatefulSet }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "apps/v1"
              result[:items] = items.map(&:serialize)
              result[:kind] = "StatefulSetList"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :stateful_set_list
          end
        end
      end
    end
  end
end