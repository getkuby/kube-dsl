module KubeDSL::DSL::Flowcontrol::V1alpha1
  class QueuingConfiguration < ::KubeDSL::DSLObject
    value_fields :hand_size, :queue_length_limit, :queues

    def serialize
      {}.tap do |result|
        result[:handSize] = hand_size
        result[:queueLengthLimit] = queue_length_limit
        result[:queues] = queues
      end
    end

    def kind
      :queuing_configuration
    end
  end
end
