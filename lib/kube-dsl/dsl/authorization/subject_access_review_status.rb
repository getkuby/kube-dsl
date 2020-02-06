module KubeDSL::DSL::Authorization
  class SubjectAccessReviewStatus
    extend ::KubeDSL::ValueFields
    value_fields :allowed, :denied, :evaluation_error, :reason

    def serialize
      {}.tap do |result|
        result[:allowed] = allowed
        result[:denied] = denied
        result[:evaluationError] = evaluation_error
        result[:reason] = reason
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
