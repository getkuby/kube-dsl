module KubeDSL::DSL::Authorization::V1
  class SelfSubjectRulesReviewSpec < ::KubeDSL::DSLObject
    value_fields :namespace

    def serialize
      {}.tap do |result|
        result[:namespace] = namespace
      end
    end

    def kind
      :self_subject_rules_review_spec
    end
  end
end
