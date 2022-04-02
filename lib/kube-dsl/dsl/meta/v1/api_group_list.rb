# typed: true

module KubeDSL
  module DSL
    module Meta
      module V1
        class APIGroupList < ::KubeDSL::DSLObject
          array_field(:group) { KubeDSL::DSL::Meta::V1::APIGroup.new }

          validates :groups, array: { kind_of: KubeDSL::DSL::Meta::V1::APIGroup }, presence: false

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "v1"
              result[:groups] = groups.map(&:serialize)
              result[:kind] = "APIGroupList"
            end
          end

          def kind_sym
            :api_group_list
          end
        end
      end
    end
  end
end