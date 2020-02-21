module KubeDSL::DSL::V1
  class ContainerState
    extend ::KubeDSL::ValueFields

    object_field(:running) { KubeDSL::DSL::V1::ContainerStateRunning.new }
    object_field(:terminated) { KubeDSL::DSL::V1::ContainerStateTerminated.new }
    object_field(:waiting) { KubeDSL::DSL::V1::ContainerStateWaiting.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:running] = running.serialize
        result[:terminated] = terminated.serialize
        result[:waiting] = waiting.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :container_state
    end
  end
end
