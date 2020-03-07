module KubeDSL::DSL::Authorization::V1beta1
  class SubjectRulesReviewStatus < ::KubeDSL::DSLObject
    value_fields :evaluation_error, :incomplete
    array_field(:non_resource_rule) { KubeDSL::DSL::Authorization::V1beta1::NonResourceRule.new }
    array_field(:resource_rule) { KubeDSL::DSL::Authorization::V1beta1::ResourceRule.new }

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
