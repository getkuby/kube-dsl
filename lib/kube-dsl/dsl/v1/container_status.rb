module KubeDSL::DSL::V1
  class ContainerStatus
    extend ::KubeDSL::ValueFields

    value_fields :container_id, :image, :image_id, :name, :ready, :restart_count, :started
    object_field(:last_state) { KubeDSL::DSL::V1::ContainerState.new }
    object_field(:state) { KubeDSL::DSL::V1::ContainerState.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:containerID] = container_id
        result[:image] = image
        result[:imageID] = image_id
        result[:name] = name
        result[:ready] = ready
        result[:restartCount] = restart_count
        result[:started] = started
        result[:lastState] = last_state.serialize
        result[:state] = state.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :container_status
    end
  end
end
