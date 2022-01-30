# typed: true

module KubeDSL::DSL::Autoscaling::V1
  class HorizontalPodAutoscalerSpec < ::KubeDSL::DSLObject
    value_field :max_replicas
    value_field :min_replicas
    object_field(:scale_target_ref) { KubeDSL::DSL::Autoscaling::V1::CrossVersionObjectReference.new }
    value_field :target_cpu_utilization_percentage

    validates :max_replicas, field: { format: :integer }, presence: false
    validates :min_replicas, field: { format: :integer }, presence: false
    validates :scale_target_ref, object: { kind_of: KubeDSL::DSL::Autoscaling::V1::CrossVersionObjectReference }
    validates :target_cpu_utilization_percentage, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:maxReplicas] = max_replicas
        result[:minReplicas] = min_replicas
        result[:scaleTargetRef] = scale_target_ref.serialize
        result[:targetCPUUtilizationPercentage] = target_cpu_utilization_percentage
      end
    end

    def kind_sym
      :horizontal_pod_autoscaler_spec
    end
  end
end
