module KubeDSL::DSL::Flowcontrol::V1beta1
  class PolicyRulesWithSubjects < ::KubeDSL::DSLObject
    array_field(:non_resource_rule) { KubeDSL::DSL::Flowcontrol::V1beta1::NonResourcePolicyRule.new }
    array_field(:resource_rule) { KubeDSL::DSL::Flowcontrol::V1beta1::ResourcePolicyRule.new }
    array_field(:subject) { KubeDSL::DSL::Flowcontrol::V1beta1::Subject.new }

    validates :non_resource_rules, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta1::NonResourcePolicyRule }, presence: false
    validates :resource_rules, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta1::ResourcePolicyRule }, presence: false
    validates :subjects, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta1::Subject }, presence: false

    def serialize
      {}.tap do |result|
        result[:nonResourceRules] = non_resource_rules.map(&:serialize)
        result[:resourceRules] = resource_rules.map(&:serialize)
        result[:subjects] = subjects.map(&:serialize)
      end
    end

    def kind_sym
      :policy_rules_with_subjects
    end
  end
end
