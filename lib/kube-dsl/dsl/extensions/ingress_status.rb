module KubeDSL::DSL::Extensions
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
  end
end
