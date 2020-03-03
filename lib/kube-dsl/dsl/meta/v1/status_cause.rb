module KubeDSL::DSL::Meta::V1
  class StatusCause < ::KubeDSL::DSLObject
    value_fields :field, :message, :reason

    def serialize
      {}.tap do |result|
        result[:field] = field
        result[:message] = message
        result[:reason] = reason
      end
    end

    def kind
      :status_cause
    end
  end
end
