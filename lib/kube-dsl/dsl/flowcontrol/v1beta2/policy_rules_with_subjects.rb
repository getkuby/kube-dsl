# typed: true

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta2
        class PolicyRulesWithSubjects < ::KubeDSL::DSLObject
          array_field(:non_resource_rule) { KubeDSL::DSL::Flowcontrol::V1beta2::NonResourcePolicyRule.new }
          array_field(:resource_rule) { KubeDSL::DSL::Flowcontrol::V1beta2::ResourcePolicyRule.new }
          array_field(:subject) { KubeDSL::DSL::Flowcontrol::V1beta2::Subject.new }

          validates :non_resource_rules, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta2::NonResourcePolicyRule }, presence: false
          validates :resource_rules, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta2::ResourcePolicyRule }, presence: false
          validates :subjects, array: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta2::Subject }, presence: false

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
    end
  end
end