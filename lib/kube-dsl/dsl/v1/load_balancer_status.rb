# typed: strict

module KubeDSL
  module DSL
    module V1
      class LoadBalancerStatus < ::KubeDSL::DSLObject
        array_field(:ingress) { KubeDSL::DSL::V1::LoadBalancerIngress.new }

        validates :ingresses, array: { kind_of: KubeDSL::DSL::V1::LoadBalancerIngress }, presence: false

        def serialize
          {}.tap do |result|
            result[:ingress] = ingresses.map(&:serialize)
          end
        end

        def kind_sym
          :load_balancer_status
        end
      end
    end
  end
end