# typed: strict

module KubeDSL
  module DSL
    module Autoscaling
      module V1
        class HorizontalPodAutoscalerStatus < ::KubeDSL::DSLObject
          value_field :current_cpu_utilization_percentage
          value_field :current_replicas
          value_field :desired_replicas
          value_field :last_scale_time
          value_field :observed_generation

          validates :current_cpu_utilization_percentage, field: { format: :integer }, presence: false
          validates :current_replicas, field: { format: :integer }, presence: false
          validates :desired_replicas, field: { format: :integer }, presence: false
          validates :last_scale_time, field: { format: :string }, presence: false
          validates :observed_generation, field: { format: :integer }, presence: false

          def serialize
            {}.tap do |result|
              result[:currentCPUUtilizationPercentage] = current_cpu_utilization_percentage
              result[:currentReplicas] = current_replicas
              result[:desiredReplicas] = desired_replicas
              result[:lastScaleTime] = last_scale_time
              result[:observedGeneration] = observed_generation
            end
          end

          def kind_sym
            :horizontal_pod_autoscaler_status
          end
        end
      end
    end
  end
end