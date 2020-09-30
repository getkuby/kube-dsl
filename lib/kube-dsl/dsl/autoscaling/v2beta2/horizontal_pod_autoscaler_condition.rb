module KubeDSL::DSL::Autoscaling::V2beta2
  class HorizontalPodAutoscalerCondition < ::KubeDSL::DSLObject
    value_field :last_transition_time
    value_field :message
    value_field :reason
    value_field :status
    value_field :type

    validates :last_transition_time, field: { format: :string }, presence: false
    validates :message, field: { format: :string }, presence: false
    validates :reason, field: { format: :string }, presence: false
    validates :status, field: { format: :string }, presence: false
    validates :type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:lastTransitionTime] = last_transition_time
        result[:message] = message
        result[:reason] = reason
        result[:status] = status
        result[:type] = type
      end
    end

    def kind_sym
      :horizontal_pod_autoscaler_condition
    end
  end
end
