module KubeDSL::DSL::Authorization
  class SelfSubjectRulesReviewSpec
    extend ::KubeDSL::ValueFields

    value_fields :namespace

    def serialize
      {}.tap do |result|
        result[:namespace] = namespace
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :self_subject_rules_review_spec
    end
  end
end
