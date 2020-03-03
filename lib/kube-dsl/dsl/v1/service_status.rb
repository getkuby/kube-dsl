module KubeDSL::DSL::V1
  class ServiceStatus < ::KubeDSL::DSLObject
    object_field(:load_balancer) { KubeDSL::DSL::V1::LoadBalancerStatus.new }

    def serialize
      {}.tap do |result|
        result[:loadBalancer] = load_balancer.serialize
      end
    end

    def kind
      :service_status
    end
  end
end
