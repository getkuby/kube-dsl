# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class ServiceBackendPort < ::KubeDSL::DSLObject
          value_field :name
          value_field :number

          validates :name, field: { format: :string }, presence: false
          validates :number, field: { format: :integer }, presence: false

          def serialize
            {}.tap do |result|
              result[:name] = name
              result[:number] = number
            end
          end

          def kind_sym
            :service_backend_port
          end
        end
      end
    end
  end
end