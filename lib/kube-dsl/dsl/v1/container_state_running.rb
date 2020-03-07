module KubeDSL::DSL::V1
  class ContainerStateRunning < ::KubeDSL::DSLObject
    value_fields :started_at

    def serialize
      {}.tap do |result|
        result[:startedAt] = started_at
      end
    end

    def kind_sym
      :container_state_running
    end
  end
end
