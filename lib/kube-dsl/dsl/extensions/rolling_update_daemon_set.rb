module KubeDSL::DSL::Extensions
  class RollingUpdateDaemonSet
    extend ::KubeDSL::ValueFields

    value_fields :max_unavailable

    def serialize
      {}.tap do |result|
        result[:maxUnavailable] = max_unavailable
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :rolling_update_daemon_set
    end
  end
end
