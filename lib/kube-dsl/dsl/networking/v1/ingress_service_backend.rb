# typed: true

module KubeDSL
  module DSL
    module Networking
      module V1
        class IngressServiceBackend < ::KubeDSL::DSLObject
          value_field :name
          object_field(:port) { KubeDSL::DSL::Networking::V1::ServiceBackendPort.new }

          validates :name, field: { format: :string }, presence: false
          validates :port, object: { kind_of: KubeDSL::DSL::Networking::V1::ServiceBackendPort }

          def serialize
            {}.tap do |result|
              result[:name] = name
              result[:port] = port.serialize
            end
          end

          def kind_sym
            :ingress_service_backend
          end
        end
      end
    end
  end
end