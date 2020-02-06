module KubeDSL::DSL::Auditregistration
  class WebhookThrottleConfig
    extend ::KubeDSL::ValueFields

    value_fields :burst, :qps

    def serialize
      {}.tap do |result|
        result[:burst] = burst
        result[:qps] = qps
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :webhook_throttle_config
    end
  end
end
