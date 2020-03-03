module KubeDSL::DSL::Extensions::V1beta1
  class RollingUpdateDaemonSet < ::KubeDSL::DSLObject
    value_fields :max_unavailable

    def serialize
      {}.tap do |result|
        result[:maxUnavailable] = max_unavailable
      end
    end

    def kind
      :rolling_update_daemon_set
    end
  end
end
