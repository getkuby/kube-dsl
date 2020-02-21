module KubeDSL::DSL::Flowcontrol::V1alpha1
  class FlowDistinguisherMethod
    extend ::KubeDSL::ValueFields

    value_fields :type

    def initialize(&block)
      instance_eval(&block) if block
    end

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
