module KubeDSL::DSL::Flowcontrol::V1alpha1
  class FlowSchemaStatus
    extend ::KubeDSL::ValueFields

    array_field(:condition) { KubeDSL::DSL::Flowcontrol::V1alpha1::FlowSchemaCondition.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :flow_schema_status
    end
  end
end
