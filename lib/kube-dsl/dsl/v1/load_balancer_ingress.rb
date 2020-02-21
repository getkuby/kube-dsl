module KubeDSL::DSL::V1
  class LoadBalancerIngress
    extend ::KubeDSL::ValueFields

    value_fields :hostname, :ip

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:hostname] = hostname
        result[:ip] = ip
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :load_balancer_ingress
    end
  end
end
