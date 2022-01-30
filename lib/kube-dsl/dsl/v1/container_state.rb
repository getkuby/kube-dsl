# typed: true

module KubeDSL::DSL::V1
  class ContainerState < ::KubeDSL::DSLObject
    object_field(:running) { KubeDSL::DSL::V1::ContainerStateRunning.new }
    object_field(:terminated) { KubeDSL::DSL::V1::ContainerStateTerminated.new }
    object_field(:waiting) { KubeDSL::DSL::V1::ContainerStateWaiting.new }

    validates :running, object: { kind_of: KubeDSL::DSL::V1::ContainerStateRunning }
    validates :terminated, object: { kind_of: KubeDSL::DSL::V1::ContainerStateTerminated }
    validates :waiting, object: { kind_of: KubeDSL::DSL::V1::ContainerStateWaiting }

    def serialize
      {}.tap do |result|
        result[:running] = running.serialize
        result[:terminated] = terminated.serialize
        result[:waiting] = waiting.serialize
      end
    end

    def kind_sym
      :container_state
    end
  end
end
