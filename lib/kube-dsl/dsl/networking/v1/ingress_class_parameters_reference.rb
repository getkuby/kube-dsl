# typed: true

module KubeDSL
  module DSL
    module Networking
      module V1
        class IngressClassParametersReference < ::KubeDSL::DSLObject
          value_field :api_group
          value_field :kind
          value_field :name
          value_field :namespace
          value_field :scope

          validates :api_group, field: { format: :string }, presence: false
          validates :kind, field: { format: :string }, presence: false
          validates :name, field: { format: :string }, presence: false
          validates :namespace, field: { format: :string }, presence: false
          validates :scope, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:apiGroup] = api_group
              result[:kind] = kind
              result[:name] = name
              result[:namespace] = namespace
              result[:scope] = scope
            end
          end

          def kind_sym
            :ingress_class_parameters_reference
          end
        end
      end
    end
  end
end