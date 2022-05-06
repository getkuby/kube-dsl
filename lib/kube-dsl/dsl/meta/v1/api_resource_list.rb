# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class APIResourceList < ::KubeDSL::DSLObject
          value_field :group_version
          array_field(:resource) { KubeDSL::DSL::Meta::V1::APIResource.new }

          validates :group_version, field: { format: :string }, presence: false
          validates :resources, array: { kind_of: KubeDSL::DSL::Meta::V1::APIResource }, presence: false

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "v1"
              result[:groupVersion] = group_version
              result[:kind] = "APIResourceList"
              result[:resources] = resources.map(&:serialize)
            end
          end

          def kind_sym
            :api_resource_list
          end
        end
      end
    end
  end
end