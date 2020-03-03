module KubeDSL::DSL::Apps::V1beta2
  class RollingUpdateStatefulSetStrategy < ::KubeDSL::DSLObject
    value_fields :partition

    def serialize
      {}.tap do |result|
        result[:partition] = partition
      end
    end

    def kind
      :rolling_update_stateful_set_strategy
    end
  end
end
