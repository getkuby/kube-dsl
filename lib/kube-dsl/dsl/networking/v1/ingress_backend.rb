# typed: true

module KubeDSL
  module DSL
    module Networking
      module V1
        class IngressBackend < ::KubeDSL::DSLObject
          object_field(:resource) { KubeDSL::DSL::V1::TypedLocalObjectReference.new }
          object_field(:service) { KubeDSL::DSL::Networking::V1::IngressServiceBackend.new }

          validates :resource, object: { kind_of: KubeDSL::DSL::V1::TypedLocalObjectReference }
          validates :service, object: { kind_of: KubeDSL::DSL::Networking::V1::IngressServiceBackend }

          def serialize
            {}.tap do |result|
              result[:resource] = resource.serialize
              result[:service] = service.serialize
            end
          end

          def kind_sym
            :ingress_backend
          end
        end
      end
    end
  end
end