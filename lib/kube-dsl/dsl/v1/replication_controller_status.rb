module KubeDSL::DSL::V1
  class ReplicationControllerStatus
    extend ::KubeDSL::ValueFields

    value_fields :available_replicas, :fully_labeled_replicas, :observed_generation, :ready_replicas, :replicas
    array_field(:condition) { KubeDSL::DSL::V1::ReplicationControllerCondition.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:availableReplicas] = available_replicas
        result[:fullyLabeledReplicas] = fully_labeled_replicas
        result[:observedGeneration] = observed_generation
        result[:readyReplicas] = ready_replicas
        result[:replicas] = replicas
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :replication_controller_status
    end
  end
end
