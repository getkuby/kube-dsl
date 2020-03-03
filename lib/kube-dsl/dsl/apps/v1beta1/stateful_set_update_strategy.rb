module KubeDSL::DSL::Apps::V1beta1
  class StatefulSetUpdateStrategy < ::KubeDSL::DSLObject
    value_fields :type
    object_field(:rolling_update) { KubeDSL::DSL::Apps::V1beta1::RollingUpdateStatefulSetStrategy.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:rollingUpdate] = rolling_update.serialize
      end
    end

    def kind
      :stateful_set_update_strategy
    end
  end
end
