# typed: true

module KubeDSL
  module DSL
    module Apiregistration
      module V1
        class ServiceReference < ::KubeDSL::DSLObject
          value_field :name
          value_field :namespace
          value_field :port

          validates :name, field: { format: :string }, presence: false
          validates :namespace, field: { format: :string }, presence: false
          validates :port, field: { format: :integer }, presence: false

          def serialize
            {}.tap do |result|
              result[:name] = name
              result[:namespace] = namespace
              result[:port] = port
            end
          end

          def kind_sym
            :service_reference
          end
        end
      end
    end
  end
end