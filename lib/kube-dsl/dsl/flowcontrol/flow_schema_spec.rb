module KubeDSL::DSL::Flowcontrol
  class FlowSchemaSpec
    extend ::KubeDSL::ValueFields
    value_fields :matching_precedence
    array_field(:rule) { KubeDSL::DSL::Flowcontrol::PolicyRulesWithSubjects.new }
    object_field(:distinguisher_method) { KubeDSL::DSL::Flowcontrol::FlowDistinguisherMethod.new }
    object_field(:priority_level_configuration) { KubeDSL::DSL::Flowcontrol::PriorityLevelConfigurationReference.new }

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
  end
end
