module KubeDSL::DSL::V1
  class LoadBalancerStatus
    extend ::KubeDSL::ValueFields

    array_field(:ingress) { KubeDSL::DSL::V1::LoadBalancerIngress.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:ingress] = ingresses.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :load_balancer_status
    end
  end
end
