module KubeDSL::DSL::Autoscaling::V2beta1
  class HorizontalPodAutoscalerStatus
    extend ::KubeDSL::ValueFields

    value_fields :current_replicas, :desired_replicas, :last_scale_time, :observed_generation
    array_field(:condition) { KubeDSL::DSL::Autoscaling::V2beta1::HorizontalPodAutoscalerCondition.new }
    array_field(:current_metric) { KubeDSL::DSL::Autoscaling::V2beta1::MetricStatus.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:currentReplicas] = current_replicas
        result[:desiredReplicas] = desired_replicas
        result[:lastScaleTime] = last_scale_time
        result[:observedGeneration] = observed_generation
        result[:conditions] = conditions.map(&:serialize)
        result[:currentMetrics] = current_metrics.map(&:serialize)
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
