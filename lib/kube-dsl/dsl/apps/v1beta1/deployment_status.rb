module KubeDSL::DSL::Apps::V1beta1
  class DeploymentStatus < ::KubeDSL::DSLObject
    value_fields :available_replicas, :collision_count, :observed_generation, :ready_replicas, :replicas, :unavailable_replicas, :updated_replicas
    array_field(:condition) { KubeDSL::DSL::Apps::V1beta1::DeploymentCondition.new }

    def serialize
      {}.tap do |result|
        result[:availableReplicas] = available_replicas
        result[:collisionCount] = collision_count
        result[:observedGeneration] = observed_generation
        result[:readyReplicas] = ready_replicas
        result[:replicas] = replicas
        result[:unavailableReplicas] = unavailable_replicas
        result[:updatedReplicas] = updated_replicas
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def kind_sym
      :deployment_status
    end
  end
end
