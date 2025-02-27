# typed: true

module KubeDSL
  module DSL
    module Autoscaling
      module V2
        class HorizontalPodAutoscalerSpec < ::KubeDSL::DSLObject
          object_field(:behavior) { KubeDSL::DSL::Autoscaling::V2::HorizontalPodAutoscalerBehavior.new }
          value_field :max_replicas
          array_field(:metric) { KubeDSL::DSL::Autoscaling::V2::MetricSpec.new }
          value_field :min_replicas
          object_field(:scale_target_ref) { KubeDSL::DSL::Autoscaling::V2::CrossVersionObjectReference.new }

          validates :behavior, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::HorizontalPodAutoscalerBehavior }
          validates :max_replicas, field: { format: :integer }, presence: false
          validates :metrics, array: { kind_of: KubeDSL::DSL::Autoscaling::V2::MetricSpec }, presence: false
          validates :min_replicas, field: { format: :integer }, presence: false
          validates :scale_target_ref, object: { kind_of: KubeDSL::DSL::Autoscaling::V2::CrossVersionObjectReference }

          def serialize
            {}.tap do |result|
              result[:behavior] = behavior.serialize
              result[:maxReplicas] = max_replicas
              result[:metrics] = metrics.map(&:serialize)
              result[:minReplicas] = min_replicas
              result[:scaleTargetRef] = scale_target_ref.serialize
            end
          end

          def kind_sym
            :horizontal_pod_autoscaler_spec
          end
        end
      end
    end
  end
end