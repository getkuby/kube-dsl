# typed: true

module KubeDSL
  module DSL
    module V1
      class ServiceStatus < ::KubeDSL::DSLObject
        array_field(:condition) { KubeDSL::DSL::Meta::V1::Condition.new }
        object_field(:load_balancer) { KubeDSL::DSL::V1::LoadBalancerStatus.new }

        validates :conditions, array: { kind_of: KubeDSL::DSL::Meta::V1::Condition }, presence: false
        validates :load_balancer, object: { kind_of: KubeDSL::DSL::V1::LoadBalancerStatus }

        def serialize
          {}.tap do |result|
            result[:conditions] = conditions.map(&:serialize)
            result[:loadBalancer] = load_balancer.serialize
          end
        end

        def kind_sym
          :service_status
        end
      end
    end
  end
end