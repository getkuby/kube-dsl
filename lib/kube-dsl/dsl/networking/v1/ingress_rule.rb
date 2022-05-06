# typed: true

module KubeDSL
  module DSL
    module Networking
      module V1
        class IngressRule < ::KubeDSL::DSLObject
          value_field :host
          object_field(:http) { KubeDSL::DSL::Networking::V1::HTTPIngressRuleValue.new }

          validates :host, field: { format: :string }, presence: false
          validates :http, object: { kind_of: KubeDSL::DSL::Networking::V1::HTTPIngressRuleValue }

          def serialize
            {}.tap do |result|
              result[:host] = host
              result[:http] = http.serialize
            end
          end

          def kind_sym
            :ingress_rule
          end
        end
      end
    end
  end
end