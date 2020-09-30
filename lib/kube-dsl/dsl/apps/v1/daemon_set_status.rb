module KubeDSL::DSL::Apps::V1
  class DaemonSetStatus < ::KubeDSL::DSLObject
    value_field :collision_count
    array_field(:condition) { KubeDSL::DSL::Apps::V1::DaemonSetCondition.new }
    value_field :current_number_scheduled
    value_field :desired_number_scheduled
    value_field :number_available
    value_field :number_misscheduled
    value_field :number_ready
    value_field :number_unavailable
    value_field :observed_generation
    value_field :updated_number_scheduled

    validates :collision_count, field: { format: :integer }, presence: false
    validates :conditions, array: { kind_of: KubeDSL::DSL::Apps::V1::DaemonSetCondition }, presence: false
    validates :current_number_scheduled, field: { format: :integer }, presence: false
    validates :desired_number_scheduled, field: { format: :integer }, presence: false
    validates :number_available, field: { format: :integer }, presence: false
    validates :number_misscheduled, field: { format: :integer }, presence: false
    validates :number_ready, field: { format: :integer }, presence: false
    validates :number_unavailable, field: { format: :integer }, presence: false
    validates :observed_generation, field: { format: :integer }, presence: false
    validates :updated_number_scheduled, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:collisionCount] = collision_count
        result[:conditions] = conditions.map(&:serialize)
        result[:currentNumberScheduled] = current_number_scheduled
        result[:desiredNumberScheduled] = desired_number_scheduled
        result[:numberAvailable] = number_available
        result[:numberMisscheduled] = number_misscheduled
        result[:numberReady] = number_ready
        result[:numberUnavailable] = number_unavailable
        result[:observedGeneration] = observed_generation
        result[:updatedNumberScheduled] = updated_number_scheduled
      end
    end

    def kind_sym
      :daemon_set_status
    end
  end
end
