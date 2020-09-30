module KubeDSL::DSL::Apps::V1beta2
  class DeploymentStatus < ::KubeDSL::DSLObject
    value_field :available_replicas
    value_field :collision_count
    array_field(:condition) { KubeDSL::DSL::Apps::V1beta2::DeploymentCondition.new }
    value_field :observed_generation
    value_field :ready_replicas
    value_field :replicas
    value_field :unavailable_replicas
    value_field :updated_replicas

    validates :available_replicas, field: { format: :integer }, presence: false
    validates :collision_count, field: { format: :integer }, presence: false
    validates :conditions, array: { kind_of: KubeDSL::DSL::Apps::V1beta2::DeploymentCondition }, presence: false
    validates :observed_generation, field: { format: :integer }, presence: false
    validates :ready_replicas, field: { format: :integer }, presence: false
    validates :replicas, field: { format: :integer }, presence: false
    validates :unavailable_replicas, field: { format: :integer }, presence: false
    validates :updated_replicas, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:availableReplicas] = available_replicas
        result[:collisionCount] = collision_count
        result[:conditions] = conditions.map(&:serialize)
        result[:observedGeneration] = observed_generation
        result[:readyReplicas] = ready_replicas
        result[:replicas] = replicas
        result[:unavailableReplicas] = unavailable_replicas
        result[:updatedReplicas] = updated_replicas
      end
    end

    def kind_sym
      :deployment_status
    end
  end
end
