module KubeDSL::DSL::Authorization::V1
  class SelfSubjectRulesReviewSpec < ::KubeDSL::DSLObject
    value_field :namespace

    validates :namespace, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:namespace] = namespace
      end
    end

    def kind_sym
      :self_subject_rules_review_spec
    end
  end
end
