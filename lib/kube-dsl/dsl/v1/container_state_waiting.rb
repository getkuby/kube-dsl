module KubeDSL::DSL::V1
  class ContainerStateWaiting < ::KubeDSL::DSLObject
    value_fields :message, :reason

    def serialize
      {}.tap do |result|
        result[:message] = message
        result[:reason] = reason
      end
    end

    def kind
      :container_state_waiting
    end
  end
end
