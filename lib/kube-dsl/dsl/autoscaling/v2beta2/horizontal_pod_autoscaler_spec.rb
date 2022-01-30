# typed: true

module KubeDSL::DSL::Autoscaling::V2beta2
  class HorizontalPodAutoscalerSpec < ::KubeDSL::DSLObject
    value_field :max_replicas
    array_field(:metric) { KubeDSL::DSL::Autoscaling::V2beta2::MetricSpec.new }
    value_field :min_replicas
    object_field(:scale_target_ref) { KubeDSL::DSL::Autoscaling::V2beta2::CrossVersionObjectReference.new }

    validates :max_replicas, field: { format: :integer }, presence: false
    validates :metrics, array: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::MetricSpec }, presence: false
    validates :min_replicas, field: { format: :integer }, presence: false
    validates :scale_target_ref, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::CrossVersionObjectReference }

    def serialize
      {}.tap do |result|
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
