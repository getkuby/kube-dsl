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
  end
end
