module KubeDSL::DSL
  class ContainerStateWaiting
    extend ::KubeDSL::ValueFields

    value_fields :message, :reason

    def serialize
      {}.tap do |result|
        result[:message] = message
        result[:reason] = reason
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :container_state_waiting
    end
  end
end
