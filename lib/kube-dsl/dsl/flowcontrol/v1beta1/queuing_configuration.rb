module KubeDSL::DSL::Flowcontrol::V1beta1
  class QueuingConfiguration < ::KubeDSL::DSLObject
    value_field :hand_size
    value_field :queue_length_limit
    value_field :queues

    validates :hand_size, field: { format: :integer }, presence: false
    validates :queue_length_limit, field: { format: :integer }, presence: false
    validates :queues, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:handSize] = hand_size
        result[:queueLengthLimit] = queue_length_limit
        result[:queues] = queues
      end
    end

    def kind_sym
      :queuing_configuration
    end
  end
end
