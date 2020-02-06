module KubeDSL::DSL
  class NamespaceCondition
    extend ::KubeDSL::ValueFields

    value_fields :last_transition_time, :message, :reason, :status, :type

    def serialize
      {}.tap do |result|
        result[:lastTransitionTime] = last_transition_time
        result[:message] = message
        result[:reason] = reason
        result[:status] = status
        result[:type] = type
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :namespace_condition
    end
  end
end
