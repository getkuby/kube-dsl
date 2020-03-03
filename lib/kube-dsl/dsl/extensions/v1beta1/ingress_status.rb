module KubeDSL::DSL::Extensions::V1beta1
  class IngressStatus < ::KubeDSL::DSLObject
    object_field(:load_balancer) { KubeDSL::DSL::V1::LoadBalancerStatus.new }

    def serialize
      {}.tap do |result|
        result[:loadBalancer] = load_balancer.serialize
      end
    end

    def kind
      :ingress_status
    end
  end
end
