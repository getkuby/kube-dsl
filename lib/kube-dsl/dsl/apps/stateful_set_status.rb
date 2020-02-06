module KubeDSL::DSL::Apps
  class StatefulSetStatus
    extend ::KubeDSL::ValueFields
    value_fields :collision_count, :current_replicas, :current_revision, :observed_generation, :ready_replicas, :replicas, :update_revision, :updated_replicas
    array_field(:condition) { KubeDSL::DSL::Apps::StatefulSetCondition.new }

    def serialize
      {}.tap do |result|
        result[:collisionCount] = collision_count
        result[:currentReplicas] = current_replicas
        result[:currentRevision] = current_revision
        result[:observedGeneration] = observed_generation
        result[:readyReplicas] = ready_replicas
        result[:replicas] = replicas
        result[:updateRevision] = update_revision
        result[:updatedReplicas] = updated_replicas
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
