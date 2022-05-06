# typed: strict

module KubeDSL
  module DSL
    module Discovery
      module V1
        class EndpointSlice < ::KubeDSL::DSLObject
          value_field :address_type
          array_field(:endpoint) { KubeDSL::DSL::Discovery::V1::Endpoint.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          array_field(:port) { KubeDSL::DSL::Discovery::V1::EndpointPort.new }

          validates :address_type, field: { format: :string }, presence: false
          validates :endpoints, array: { kind_of: KubeDSL::DSL::Discovery::V1::Endpoint }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :ports, array: { kind_of: KubeDSL::DSL::Discovery::V1::EndpointPort }, presence: false

          def serialize
            {}.tap do |result|
              result[:addressType] = address_type
              result[:apiVersion] = "discovery.k8s.io/v1"
              result[:endpoints] = endpoints.map(&:serialize)
              result[:kind] = "EndpointSlice"
              result[:metadata] = metadata.serialize
              result[:ports] = ports.map(&:serialize)
            end
          end

          def kind_sym
            :endpoint_slice
          end
        end
      end
    end
  end
end