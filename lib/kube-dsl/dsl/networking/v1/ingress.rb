# typed: true

module KubeDSL
  module DSL
    module Networking
      module V1
        class Ingress < ::KubeDSL::DSLObject
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          object_field(:spec) { KubeDSL::DSL::Networking::V1::IngressSpec.new }
          object_field(:status) { KubeDSL::DSL::Networking::V1::IngressStatus.new }

          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :spec, object: { kind_of: KubeDSL::DSL::Networking::V1::IngressSpec }
          validates :status, object: { kind_of: KubeDSL::DSL::Networking::V1::IngressStatus }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "networking.k8s.io/v1"
              result[:kind] = "Ingress"
              result[:metadata] = metadata.serialize
              result[:spec] = spec.serialize
              result[:status] = status.serialize
            end
          end

          def kind_sym
            :ingress
          end
        end
      end
    end
  end
end