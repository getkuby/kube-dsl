module KubeDSL::DSL::Flowcontrol
  class FlowDistinguisherMethod
    extend ::KubeDSL::ValueFields

    value_fields :type

    def serialize
      {}.tap do |result|
        result[:type] = type
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :flow_distinguisher_method
    end
  end
end
