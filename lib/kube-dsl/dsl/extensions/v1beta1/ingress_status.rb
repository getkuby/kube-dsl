module KubeDSL::DSL::Extensions::V1beta1
  class IngressStatus
    extend ::KubeDSL::ValueFields

    object_field(:load_balancer) { KubeDSL::DSL::V1::LoadBalancerStatus.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
