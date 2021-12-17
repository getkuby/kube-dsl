module KubeDSL::DSL::Flowcontrol::V1beta1
  class FlowSchemaSpec < ::KubeDSL::DSLObject
    object_field(:distinguisher_method) { KubeDSL::DSL::Flowcontrol::V1beta1::FlowDistinguisherMethod.new }
    value_field :matching_precedence
    object_field(:priority_level_configuration) { KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationReference.new }
    array_field(:rule) { KubeDSL::DSL::Flowcontrol::V1beta1::PolicyRulesWithSubjects.new }

    validates :distinguisher_method, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta1::FlowDistinguisherMethod }
    validates :matching_precedence, field: { format: :integer }, presence: false
    validates :priority_level_configuration, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationReference }
    validates :rules, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta1::PolicyRulesWithSubjects }, presence: false

    def serialize
      {}.tap do |result|
        result[:distinguisherMethod] = distinguisher_method.serialize
        result[:matchingPrecedence] = matching_precedence
        result[:priorityLevelConfiguration] = priority_level_configuration.serialize
        result[:rules] = rules.map(&:serialize)
      end
    end

    def kind_sym
      :flow_schema_spec
    end
  end
end
