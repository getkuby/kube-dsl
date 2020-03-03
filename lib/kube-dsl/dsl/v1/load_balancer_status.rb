module KubeDSL::DSL::V1
  class LoadBalancerStatus < ::KubeDSL::DSLObject
    array_field(:ingress) { KubeDSL::DSL::V1::LoadBalancerIngress.new }

    def serialize
      {}.tap do |result|
        result[:ingress] = ingresses.map(&:serialize)
      end
    end

    def kind
      :load_balancer_status
    end
  end
end
