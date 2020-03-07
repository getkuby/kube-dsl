module KubeDSL::DSL::Auditregistration::V1alpha1
  class WebhookThrottleConfig < ::KubeDSL::DSLObject
    value_fields :burst, :qps

    def serialize
      {}.tap do |result|
        result[:burst] = burst
        result[:qps] = qps
      end
    end

    def kind_sym
      :webhook_throttle_config
    end
  end
end
