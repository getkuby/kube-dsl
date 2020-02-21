module KubeDSL::DSL::Discovery::V1beta1
  class EndpointConditions
    extend ::KubeDSL::ValueFields

    value_fields :ready

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:ready] = ready
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :endpoint_conditions
    end
  end
end
