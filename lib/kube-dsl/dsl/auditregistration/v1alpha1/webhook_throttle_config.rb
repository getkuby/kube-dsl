# typed: true

module KubeDSL::DSL::Auditregistration::V1alpha1
  class WebhookThrottleConfig < ::KubeDSL::DSLObject
    value_field :burst
    value_field :qps

    validates :burst, field: { format: :integer }, presence: false
    validates :qps, field: { format: :integer }, presence: false

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
