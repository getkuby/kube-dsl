module KubeDSL::DSL::Meta::V1
  class StatusCause
    extend ::KubeDSL::ValueFields

    value_fields :field, :message, :reason

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :status_cause
    end
  end
end
