module KubeDSL::DSL::Apps::V1beta2
  class ReplicaSetStatus < ::KubeDSL::DSLObject
    value_fields :available_replicas, :fully_labeled_replicas, :observed_generation, :ready_replicas, :replicas
    array_field(:condition) { KubeDSL::DSL::Apps::V1beta2::ReplicaSetCondition.new }

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

    def kind
      :replica_set_status
    end
  end
end
