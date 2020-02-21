module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PolicyRulesWithSubjects
    extend ::KubeDSL::ValueFields

    array_field(:non_resource_rule) { KubeDSL::DSL::Flowcontrol::V1alpha1::NonResourcePolicyRule.new }
    array_field(:resource_rule) { KubeDSL::DSL::Flowcontrol::V1alpha1::ResourcePolicyRule.new }
    array_field(:subject) { KubeDSL::DSL::Flowcontrol::V1alpha1::Subject.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:nonResourceRules] = non_resource_rules.map(&:serialize)
        result[:resourceRules] = resource_rules.map(&:serialize)
        result[:subjects] = subjects.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :policy_rules_with_subjects
    end
  end
end
