module KubeDSL::DSL
  class LoadBalancerStatus
    extend ::KubeDSL::ValueFields
    array_field(:ingress) { KubeDSL::DSL::LoadBalancerIngress.new }

    def serialize
      {}.tap do |result|
        result[:ingress] = ingresses.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
