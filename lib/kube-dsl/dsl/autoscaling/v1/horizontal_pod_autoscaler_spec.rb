module KubeDSL::DSL::Autoscaling::V1
  class HorizontalPodAutoscalerSpec
    extend ::KubeDSL::ValueFields

    value_fields :max_replicas, :min_replicas, :target_cpu_utilization_percentage
    object_field(:scale_target_ref) { KubeDSL::DSL::Autoscaling::V1::CrossVersionObjectReference.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:maxReplicas] = max_replicas
        result[:minReplicas] = min_replicas
        result[:targetCPUUtilizationPercentage] = target_cpu_utilization_percentage
        result[:scaleTargetRef] = scale_target_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :horizontal_pod_autoscaler_spec
    end
  end
end
