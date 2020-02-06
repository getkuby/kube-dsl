module KubeDSL::DSL::Apps
  class RollingUpdateStatefulSetStrategy
    extend ::KubeDSL::ValueFields

    value_fields :partition

    def serialize
      {}.tap do |result|
        result[:partition] = partition
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :rolling_update_stateful_set_strategy
    end
  end
end
