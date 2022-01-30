# typed: true

module KubeDSL::DSL::V1
  class ReplicationControllerStatus < ::KubeDSL::DSLObject
    value_field :available_replicas
    array_field(:condition) { KubeDSL::DSL::V1::ReplicationControllerCondition.new }
    value_field :fully_labeled_replicas
    value_field :observed_generation
    value_field :ready_replicas
    value_field :replicas

    validates :available_replicas, field: { format: :integer }, presence: false
    validates :conditions, array: { kind_of: KubeDSL::DSL::V1::ReplicationControllerCondition }, presence: false
    validates :fully_labeled_replicas, field: { format: :integer }, presence: false
    validates :observed_generation, field: { format: :integer }, presence: false
    validates :ready_replicas, field: { format: :integer }, presence: false
    validates :replicas, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:availableReplicas] = available_replicas
        result[:conditions] = conditions.map(&:serialize)
        result[:fullyLabeledReplicas] = fully_labeled_replicas
        result[:observedGeneration] = observed_generation
        result[:readyReplicas] = ready_replicas
        result[:replicas] = replicas
      end
    end

    def kind_sym
      :replication_controller_status
    end
  end
end
