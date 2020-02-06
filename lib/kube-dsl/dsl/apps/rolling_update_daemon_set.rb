module KubeDSL::DSL::Apps
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
  end
end
