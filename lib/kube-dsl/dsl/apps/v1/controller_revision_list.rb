# typed: strict

module KubeDSL
  module DSL
    module Apps
      module V1
        class ControllerRevisionList < ::KubeDSL::DSLObject
          array_field(:item) { KubeDSL::DSL::Apps::V1::ControllerRevision.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

          validates :items, array: { kind_of: KubeDSL::DSL::Apps::V1::ControllerRevision }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "apps/v1"
              result[:items] = items.map(&:serialize)
              result[:kind] = "ControllerRevisionList"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :controller_revision_list
          end
        end
      end
    end
  end
end