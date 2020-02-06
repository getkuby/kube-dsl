module KubeDSL::DSL::Flowcontrol
  class FlowSchemaStatus
    extend ::KubeDSL::ValueFields

    array_field(:condition) { KubeDSL::DSL::Flowcontrol::FlowSchemaCondition.new }

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
