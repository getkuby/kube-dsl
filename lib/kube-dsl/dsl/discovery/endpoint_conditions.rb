module KubeDSL::DSL::Discovery
  class EndpointConditions
    extend ::KubeDSL::ValueFields

    value_fields :ready

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
