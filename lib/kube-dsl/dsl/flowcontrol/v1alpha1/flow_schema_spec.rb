module KubeDSL::DSL::Flowcontrol::V1alpha1
  class FlowSchemaSpec
    extend ::KubeDSL::ValueFields

    value_fields :matching_precedence
    array_field(:rule) { KubeDSL::DSL::Flowcontrol::V1alpha1::PolicyRulesWithSubjects.new }
    object_field(:distinguisher_method) { KubeDSL::DSL::Flowcontrol::V1alpha1::FlowDistinguisherMethod.new }
    object_field(:priority_level_configuration) { KubeDSL::DSL::Flowcontrol::V1alpha1::PriorityLevelConfigurationReference.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:matchingPrecedence] = matching_precedence
        result[:rules] = rules.map(&:serialize)
        result[:distinguisherMethod] = distinguisher_method.serialize
        result[:priorityLevelConfiguration] = priority_level_configuration.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :flow_schema_spec
    end
  end
end
