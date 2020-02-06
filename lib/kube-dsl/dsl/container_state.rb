module KubeDSL::DSL
  class ContainerState
    extend ::KubeDSL::ValueFields
    object_field(:running) { KubeDSL::DSL::ContainerStateRunning.new }
    object_field(:terminated) { KubeDSL::DSL::ContainerStateTerminated.new }
    object_field(:waiting) { KubeDSL::DSL::ContainerStateWaiting.new }

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
  end
end
