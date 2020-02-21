module KubeDSL::DSL::V1
  class ContainerStateWaiting
    extend ::KubeDSL::ValueFields

    value_fields :message, :reason

    def initialize(&block)
      instance_eval(&block) if block
    end

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
