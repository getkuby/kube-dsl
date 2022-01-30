# typed: true

module KubeDSL::DSL::Networking::V1beta1
  class IngressStatus < ::KubeDSL::DSLObject
    object_field(:load_balancer) { KubeDSL::DSL::V1::LoadBalancerStatus.new }

    validates :load_balancer, object: { kind_of: KubeDSL::DSL::V1::LoadBalancerStatus }

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
