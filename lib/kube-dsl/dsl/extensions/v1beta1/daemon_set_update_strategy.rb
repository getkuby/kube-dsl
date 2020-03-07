module KubeDSL::DSL::Extensions::V1beta1
  class DaemonSetUpdateStrategy < ::KubeDSL::DSLObject
    value_fields :type
    object_field(:rolling_update) { KubeDSL::DSL::Extensions::V1beta1::RollingUpdateDaemonSet.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:rollingUpdate] = rolling_update.serialize
      end
    end

    def kind_sym
      :daemon_set_update_strategy
    end
  end
end
