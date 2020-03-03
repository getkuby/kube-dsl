module KubeDSL::DSL::Flowcontrol::V1alpha1
  class FlowDistinguisherMethod < ::KubeDSL::DSLObject
    value_fields :type

    def serialize
      {}.tap do |result|
        result[:type] = type
      end
    end

    def kind
      :flow_distinguisher_method
    end
  end
end
