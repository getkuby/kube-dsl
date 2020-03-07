module KubeDSL::DSL::Authorization::V1beta1
  class SubjectAccessReviewStatus < ::KubeDSL::DSLObject
    value_fields :allowed, :denied, :evaluation_error, :reason

    def serialize
      {}.tap do |result|
        result[:allowed] = allowed
        result[:denied] = denied
        result[:evaluationError] = evaluation_error
        result[:reason] = reason
      end
    end

    def kind_sym
      :subject_access_review_status
    end
  end
end
