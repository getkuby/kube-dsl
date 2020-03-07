module KubeDSL::DSL::Flowcontrol::V1alpha1
  class FlowSchemaSpec < ::KubeDSL::DSLObject
    value_fields :matching_precedence
    array_field(:rule) { KubeDSL::DSL::Flowcontrol::V1alpha1::PolicyRulesWithSubjects.new }
    object_field(:distinguisher_method) { KubeDSL::DSL::Flowcontrol::V1alpha1::FlowDistinguisherMethod.new }
    object_field(:priority_level_configuration) { KubeDSL::DSL::Flowcontrol::V1alpha1::PriorityLevelConfigurationReference.new }

    def serialize
      {}.tap do |result|
        result[:matchingPrecedence] = matching_precedence
        result[:rules] = rules.map(&:serialize)
        result[:distinguisherMethod] = distinguisher_method.serialize
        result[:priorityLevelConfiguration] = priority_level_configuration.serialize
      end
    end

    def kind_sym
      :flow_schema_spec
    end
  end
end
