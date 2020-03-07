module KubeDSL::DSL::Networking::V1beta1
  class IngressStatus < ::KubeDSL::DSLObject
    object_field(:load_balancer) { KubeDSL::DSL::V1::LoadBalancerStatus.new }

    def serialize
      {}.tap do |result|
        result[:loadBalancer] = load_balancer.serialize
      end
    end

    def kind_sym
      :ingress_status
    end
  end
end
