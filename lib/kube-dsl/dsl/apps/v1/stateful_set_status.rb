# typed: true

module KubeDSL
  module DSL
    module Apps
      module V1
        class StatefulSetStatus < ::KubeDSL::DSLObject
          value_field :available_replicas
          value_field :collision_count
          array_field(:condition) { KubeDSL::DSL::Apps::V1::StatefulSetCondition.new }
          value_field :current_replicas
          value_field :current_revision
          value_field :observed_generation
          value_field :ready_replicas
          value_field :replicas
          value_field :update_revision
          value_field :updated_replicas

          validates :available_replicas, field: { format: :integer }, presence: false
          validates :collision_count, field: { format: :integer }, presence: false
          validates :conditions, array: { kind_of: KubeDSL::DSL::Apps::V1::StatefulSetCondition }, presence: false
          validates :current_replicas, field: { format: :integer }, presence: false
          validates :current_revision, field: { format: :string }, presence: false
          validates :observed_generation, field: { format: :integer }, presence: false
          validates :ready_replicas, field: { format: :integer }, presence: false
          validates :replicas, field: { format: :integer }, presence: false
          validates :update_revision, field: { format: :string }, presence: false
          validates :updated_replicas, field: { format: :integer }, presence: false

          def serialize
            {}.tap do |result|
              result[:availableReplicas] = available_replicas
              result[:collisionCount] = collision_count
              result[:conditions] = conditions.map(&:serialize)
              result[:currentReplicas] = current_replicas
              result[:currentRevision] = current_revision
              result[:observedGeneration] = observed_generation
              result[:readyReplicas] = ready_replicas
              result[:replicas] = replicas
              result[:updateRevision] = update_revision
              result[:updatedReplicas] = updated_replicas
            end
          end

          def kind_sym
            :stateful_set_status
          end
        end
      end
    end
  end
end