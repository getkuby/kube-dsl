module KubeDSL::DSL::Apps::V1beta2
  class RollingUpdateStatefulSetStrategy
    extend ::KubeDSL::ValueFields

    value_fields :partition

    def initialize(&block)
      instance_eval(&block) if block
    end

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
