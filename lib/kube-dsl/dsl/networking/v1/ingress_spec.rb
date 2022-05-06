# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class IngressSpec < ::KubeDSL::DSLObject
          object_field(:default_backend) { KubeDSL::DSL::Networking::V1::IngressBackend.new }
          value_field :ingress_class_name
          array_field(:rule) { KubeDSL::DSL::Networking::V1::IngressRule.new }
          array_field(:tls) { KubeDSL::DSL::Networking::V1::IngressTLS.new }

          validates :default_backend, object: { kind_of: KubeDSL::DSL::Networking::V1::IngressBackend }
          validates :ingress_class_name, field: { format: :string }, presence: false
          validates :rules, array: { kind_of: KubeDSL::DSL::Networking::V1::IngressRule }, presence: false
          validates :tlses, array: { kind_of: KubeDSL::DSL::Networking::V1::IngressTLS }, presence: false

          def serialize
            {}.tap do |result|
              result[:defaultBackend] = default_backend.serialize
              result[:ingressClassName] = ingress_class_name
              result[:rules] = rules.map(&:serialize)
              result[:tls] = tlses.map(&:serialize)
            end
          end

          def kind_sym
            :ingress_spec
          end
        end
      end
    end
  end
end