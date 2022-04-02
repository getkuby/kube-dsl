# typed: true

module KubeDSL
  module DSL
    module Authorization
      module V1
        class SubjectRulesReviewStatus < ::KubeDSL::DSLObject
          value_field :evaluation_error
          value_field :incomplete
          array_field(:non_resource_rule) { KubeDSL::DSL::Authorization::V1::NonResourceRule.new }
          array_field(:resource_rule) { KubeDSL::DSL::Authorization::V1::ResourceRule.new }

          validates :evaluation_error, field: { format: :string }, presence: false
          validates :incomplete, field: { format: :boolean }, presence: false
          validates :non_resource_rules, array: { kind_of: KubeDSL::DSL::Authorization::V1::NonResourceRule }, presence: false
          validates :resource_rules, array: { kind_of: KubeDSL::DSL::Authorization::V1::ResourceRule }, presence: false

          def serialize
            {}.tap do |result|
              result[:evaluationError] = evaluation_error
              result[:incomplete] = incomplete
              result[:nonResourceRules] = non_resource_rules.map(&:serialize)
              result[:resourceRules] = resource_rules.map(&:serialize)
            end
          end

          def kind_sym
            :subject_rules_review_status
          end
        end
      end
    end
  end
end