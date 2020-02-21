module KubeDSL::DSL::Autoscaling::V1
  class HorizontalPodAutoscalerStatus
    extend ::KubeDSL::ValueFields

    value_fields :current_cpu_utilization_percentage, :current_replicas, :desired_replicas, :last_scale_time, :observed_generation

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:currentCPUUtilizationPercentage] = current_cpu_utilization_percentage
        result[:currentReplicas] = current_replicas
        result[:desiredReplicas] = desired_replicas
        result[:lastScaleTime] = last_scale_time
        result[:observedGeneration] = observed_generation
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :horizontal_pod_autoscaler_status
    end
  end
end
