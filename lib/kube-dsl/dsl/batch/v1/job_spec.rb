# typed: strict

module KubeDSL
  module DSL
    module Batch
      module V1
        class JobSpec < ::KubeDSL::DSLObject
          value_field :active_deadline_seconds
          value_field :backoff_limit
          value_field :completion_mode
          value_field :completions
          value_field :manual_selector
          value_field :parallelism
          object_field(:selector) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
          value_field :suspend
          object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }
          value_field :ttl_seconds_after_finished

          validates :active_deadline_seconds, field: { format: :integer }, presence: false
          validates :backoff_limit, field: { format: :integer }, presence: false
          validates :completion_mode, field: { format: :string }, presence: false
          validates :completions, field: { format: :integer }, presence: false
          validates :manual_selector, field: { format: :boolean }, presence: false
          validates :parallelism, field: { format: :integer }, presence: false
          validates :selector, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
          validates :suspend, field: { format: :boolean }, presence: false
          validates :template, object: { kind_of: KubeDSL::DSL::V1::PodTemplateSpec }
          validates :ttl_seconds_after_finished, field: { format: :integer }, presence: false

          def serialize
            {}.tap do |result|
              result[:activeDeadlineSeconds] = active_deadline_seconds
              result[:backoffLimit] = backoff_limit
              result[:completionMode] = completion_mode
              result[:completions] = completions
              result[:manualSelector] = manual_selector
              result[:parallelism] = parallelism
              result[:selector] = selector.serialize
              result[:suspend] = suspend
              result[:template] = template.serialize
              result[:ttlSecondsAfterFinished] = ttl_seconds_after_finished
            end
          end

          def kind_sym
            :job_spec
          end
        end
      end
    end
  end
end