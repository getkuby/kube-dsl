module KubeDSL::DSL::Authorization::V1beta1
  class SubjectRulesReviewStatus
    extend ::KubeDSL::ValueFields

    value_fields :evaluation_error, :incomplete
    array_field(:non_resource_rule) { KubeDSL::DSL::Authorization::V1beta1::NonResourceRule.new }
    array_field(:resource_rule) { KubeDSL::DSL::Authorization::V1beta1::ResourceRule.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:evaluationError] = evaluation_error
        result[:incomplete] = incomplete
        result[:nonResourceRules] = non_resource_rules.map(&:serialize)
        result[:resourceRules] = resource_rules.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :subject_rules_review_status
    end
  end
end
