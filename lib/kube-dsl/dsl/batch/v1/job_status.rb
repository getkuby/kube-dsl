# typed: true

module KubeDSL
  module DSL
    module Batch
      module V1
        class JobStatus < ::KubeDSL::DSLObject
          value_field :active
          value_field :completed_indexes
          value_field :completion_time
          array_field(:condition) { KubeDSL::DSL::Batch::V1::JobCondition.new }
          value_field :failed
          value_field :ready
          value_field :start_time
          value_field :succeeded
          object_field(:uncounted_terminated_pods) { KubeDSL::DSL::Batch::V1::UncountedTerminatedPods.new }

          validates :active, field: { format: :integer }, presence: false
          validates :completed_indexes, field: { format: :string }, presence: false
          validates :completion_time, field: { format: :string }, presence: false
          validates :conditions, array: { kind_of: KubeDSL::DSL::Batch::V1::JobCondition }, presence: false
          validates :failed, field: { format: :integer }, presence: false
          validates :ready, field: { format: :integer }, presence: false
          validates :start_time, field: { format: :string }, presence: false
          validates :succeeded, field: { format: :integer }, presence: false
          validates :uncounted_terminated_pods, object: { kind_of: KubeDSL::DSL::Batch::V1::UncountedTerminatedPods }

          def serialize
            {}.tap do |result|
              result[:active] = active
              result[:completedIndexes] = completed_indexes
              result[:completionTime] = completion_time
              result[:conditions] = conditions.map(&:serialize)
              result[:failed] = failed
              result[:ready] = ready
              result[:startTime] = start_time
              result[:succeeded] = succeeded
              result[:uncountedTerminatedPods] = uncounted_terminated_pods.serialize
            end
          end

          def kind_sym
            :job_status
          end
        end
      end
    end
  end
end