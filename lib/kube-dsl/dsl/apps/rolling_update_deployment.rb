module KubeDSL::DSL::Apps
  class RollingUpdateDeployment
    extend ::KubeDSL::ValueFields
    value_fields :max_surge, :max_unavailable

    def serialize
      {}.tap do |result|
        result[:maxSurge] = max_surge
        result[:maxUnavailable] = max_unavailable
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
