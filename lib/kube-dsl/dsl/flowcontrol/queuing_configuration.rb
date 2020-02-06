module KubeDSL::DSL::Flowcontrol
  class QueuingConfiguration
    extend ::KubeDSL::ValueFields

    value_fields :hand_size, :queue_length_limit, :queues

    def serialize
      {}.tap do |result|
        result[:handSize] = hand_size
        result[:queueLengthLimit] = queue_length_limit
        result[:queues] = queues
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :queuing_configuration
    end
  end
end
