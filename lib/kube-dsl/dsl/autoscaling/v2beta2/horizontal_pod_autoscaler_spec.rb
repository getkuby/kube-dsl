module KubeDSL::DSL::Autoscaling::V2beta2
  class HorizontalPodAutoscalerSpec < ::KubeDSL::DSLObject
    value_fields :max_replicas, :min_replicas
    array_field(:metric) { KubeDSL::DSL::Autoscaling::V2beta2::MetricSpec.new }
    object_field(:scale_target_ref) { KubeDSL::DSL::Autoscaling::V2beta2::CrossVersionObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:maxReplicas] = max_replicas
        result[:minReplicas] = min_replicas
        result[:metrics] = metrics.map(&:serialize)
        result[:scaleTargetRef] = scale_target_ref.serialize
      end
    end

    def kind
      :horizontal_pod_autoscaler_spec
    end
  end
end
