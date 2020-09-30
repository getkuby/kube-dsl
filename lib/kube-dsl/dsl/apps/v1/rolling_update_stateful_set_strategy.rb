module KubeDSL::DSL::Apps::V1
  class RollingUpdateStatefulSetStrategy < ::KubeDSL::DSLObject
    value_field :partition

    validates :partition, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:partition] = partition
      end
    end

    def kind_sym
      :rolling_update_stateful_set_strategy
    end
  end
end
