module KubeDSL::DSL::Apps::V1beta2
  class RollingUpdateDeployment
    extend ::KubeDSL::ValueFields

    value_fields :max_surge, :max_unavailable

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:maxSurge] = max_surge
        result[:maxUnavailable] = max_unavailable
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :rolling_update_deployment
    end
  end
end
