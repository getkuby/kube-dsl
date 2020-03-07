module KubeDSL::DSL::V1
  class LoadBalancerIngress < ::KubeDSL::DSLObject
    value_fields :hostname, :ip

    def serialize
      {}.tap do |result|
        result[:hostname] = hostname
        result[:ip] = ip
      end
    end

    def kind_sym
      :load_balancer_ingress
    end
  end
end
