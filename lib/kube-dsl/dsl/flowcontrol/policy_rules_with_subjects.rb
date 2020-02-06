module KubeDSL::DSL::Flowcontrol
  class PolicyRulesWithSubjects
    extend ::KubeDSL::ValueFields

    array_field(:non_resource_rule) { KubeDSL::DSL::Flowcontrol::NonResourcePolicyRule.new }
    array_field(:resource_rule) { KubeDSL::DSL::Flowcontrol::ResourcePolicyRule.new }
    array_field(:subject) { KubeDSL::DSL::Flowcontrol::Subject.new }

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
