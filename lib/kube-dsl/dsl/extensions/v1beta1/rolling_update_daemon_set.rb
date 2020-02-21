module KubeDSL::DSL::Extensions::V1beta1
  class RollingUpdateDaemonSet
    extend ::KubeDSL::ValueFields

    value_fields :max_unavailable

    def initialize(&block)
      instance_eval(&block) if block
    end

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
