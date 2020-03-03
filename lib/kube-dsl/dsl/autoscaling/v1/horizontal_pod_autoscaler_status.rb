module KubeDSL::DSL::Autoscaling::V1
  class HorizontalPodAutoscalerStatus < ::KubeDSL::DSLObject
    value_fields :current_cpu_utilization_percentage, :current_replicas, :desired_replicas, :last_scale_time, :observed_generation

    def serialize
      {}.tap do |result|
        result[:currentCPUUtilizationPercentage] = current_cpu_utilization_percentage
        result[:currentReplicas] = current_replicas
        result[:desiredReplicas] = desired_replicas
        result[:lastScaleTime] = last_scale_time
        result[:observedGeneration] = observed_generation
      end
    end

    def kind
      :horizontal_pod_autoscaler_status
    end
  end
end
