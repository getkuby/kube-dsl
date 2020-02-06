module KubeDSL::DSL::Networking
  class IngressStatus
    extend ::KubeDSL::ValueFields

    object_field(:load_balancer) { KubeDSL::DSL::LoadBalancerStatus.new }

    def serialize
      {}.tap do |result|
        result[:loadBalancer] = load_balancer.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :ingress_status
    end
  end
end
