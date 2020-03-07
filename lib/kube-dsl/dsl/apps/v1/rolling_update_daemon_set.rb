module KubeDSL::DSL::Apps::V1
  class RollingUpdateDaemonSet < ::KubeDSL::DSLObject
    value_fields :max_unavailable

    def serialize
      {}.tap do |result|
        result[:maxUnavailable] = max_unavailable
      end
    end

    def kind_sym
      :rolling_update_daemon_set
    end
  end
end
