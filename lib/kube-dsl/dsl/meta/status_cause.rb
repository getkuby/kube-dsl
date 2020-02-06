module KubeDSL::DSL::Meta
  class StatusCause
    extend ::KubeDSL::ValueFields
    value_fields :field, :message, :reason

    def serialize
      {}.tap do |result|
        result[:field] = field
        result[:message] = message
        result[:reason] = reason
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
