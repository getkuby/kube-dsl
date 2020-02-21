module KubeDSL::DSL::Auditregistration::V1alpha1
  class WebhookThrottleConfig
    extend ::KubeDSL::ValueFields

    value_fields :burst, :qps

    def initialize(&block)
      instance_eval(&block) if block
    end

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
