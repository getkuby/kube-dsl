module KubeDSL::DSL::V1
  class ContainerStateRunning
    extend ::KubeDSL::ValueFields

    value_fields :started_at

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:startedAt] = started_at
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :container_state_running
    end
  end
end
