module KubeDSL::DSL::V1
  class ServiceStatus < ::KubeDSL::DSLObject
    object_field(:load_balancer) { KubeDSL::DSL::V1::LoadBalancerStatus.new }

    validates :load_balancer, object: { kind_of: KubeDSL::DSL::V1::LoadBalancerStatus }

    def serialize
      {}.tap do |result|
        result[:loadBalancer] = load_balancer.serialize
      end
    end

    def kind_sym
      :service_status
    end
  end
end
