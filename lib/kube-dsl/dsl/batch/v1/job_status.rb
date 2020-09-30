module KubeDSL::DSL::Batch::V1
  class JobStatus < ::KubeDSL::DSLObject
    value_field :active
    value_field :completion_time
    array_field(:condition) { KubeDSL::DSL::Batch::V1::JobCondition.new }
    value_field :failed
    value_field :start_time
    value_field :succeeded

    validates :active, field: { format: :integer }, presence: false
    validates :completion_time, field: { format: :string }, presence: false
    validates :conditions, array: { kind_of: KubeDSL::DSL::Batch::V1::JobCondition }, presence: false
    validates :failed, field: { format: :integer }, presence: false
    validates :start_time, field: { format: :string }, presence: false
    validates :succeeded, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:active] = active
        result[:completionTime] = completion_time
        result[:conditions] = conditions.map(&:serialize)
        result[:failed] = failed
        result[:startTime] = start_time
        result[:succeeded] = succeeded
      end
    end

    def kind_sym
      :job_status
    end
  end
end
