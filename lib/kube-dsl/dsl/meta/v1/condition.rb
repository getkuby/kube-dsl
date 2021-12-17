module KubeDSL::DSL::Meta::V1
  class Condition < ::KubeDSL::DSLObject
    value_field :last_transition_time
    value_field :message
    value_field :observed_generation
    value_field :reason
    value_field :status
    value_field :type

    validates :last_transition_time, field: { format: :string }, presence: false
    validates :message, field: { format: :string }, presence: false
    validates :observed_generation, field: { format: :integer }, presence: false
    validates :reason, field: { format: :string }, presence: false
    validates :status, field: { format: :string }, presence: false
    validates :type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:lastTransitionTime] = last_transition_time
        result[:message] = message
        result[:observedGeneration] = observed_generation
        result[:reason] = reason
        result[:status] = status
        result[:type] = type
      end
    end

    def kind_sym
      :condition
    end
  end
end
