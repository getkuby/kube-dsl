module KubeDSL::DSL::Flowcontrol::V1alpha1
  class FlowSchemaStatus < ::KubeDSL::DSLObject
    array_field(:condition) { KubeDSL::DSL::Flowcontrol::V1alpha1::FlowSchemaCondition.new }

    validates :conditions, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1alpha1::FlowSchemaCondition }, presence: false

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def kind_sym
      :flow_schema_status
    end
  end
end
