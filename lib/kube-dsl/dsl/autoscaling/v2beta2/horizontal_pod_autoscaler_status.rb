# typed: true

module KubeDSL::DSL::Autoscaling::V2beta2
  class HorizontalPodAutoscalerStatus < ::KubeDSL::DSLObject
    array_field(:condition) { KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscalerCondition.new }
    array_field(:current_metric) { KubeDSL::DSL::Autoscaling::V2beta2::MetricStatus.new }
    value_field :current_replicas
    value_field :desired_replicas
    value_field :last_scale_time
    value_field :observed_generation

    validates :conditions, array: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscalerCondition }, presence: false
    validates :current_metrics, array: { kind_of: KubeDSL::DSL::Autoscaling::V2beta2::MetricStatus }, presence: false
    validates :current_replicas, field: { format: :integer }, presence: false
    validates :desired_replicas, field: { format: :integer }, presence: false
    validates :last_scale_time, field: { format: :string }, presence: false
    validates :observed_generation, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
        result[:currentMetrics] = current_metrics.map(&:serialize)
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
