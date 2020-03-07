module KubeDSL::DSL::Apps::V1
  class RollingUpdateDeployment < ::KubeDSL::DSLObject
    value_fields :max_surge, :max_unavailable

    def serialize
      {}.tap do |result|
        result[:maxSurge] = max_surge
        result[:maxUnavailable] = max_unavailable
      end
    end

    def kind_sym
      :rolling_update_deployment
    end
  end
end
