module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PolicyRulesWithSubjects < ::KubeDSL::DSLObject
    array_field(:non_resource_rule) { KubeDSL::DSL::Flowcontrol::V1alpha1::NonResourcePolicyRule.new }
    array_field(:resource_rule) { KubeDSL::DSL::Flowcontrol::V1alpha1::ResourcePolicyRule.new }
    array_field(:subject) { KubeDSL::DSL::Flowcontrol::V1alpha1::Subject.new }

    def serialize
      {}.tap do |result|
        result[:nonResourceRules] = non_resource_rules.map(&:serialize)
        result[:resourceRules] = resource_rules.map(&:serialize)
        result[:subjects] = subjects.map(&:serialize)
      end
    end

    def kind
      :policy_rules_with_subjects
    end
  end
end
