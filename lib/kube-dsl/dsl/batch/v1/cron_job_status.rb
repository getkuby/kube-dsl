# typed: true

module KubeDSL
  module DSL
    module Batch
      module V1
        class CronJobStatus < ::KubeDSL::DSLObject
          array_field(:active) { KubeDSL::DSL::V1::ObjectReference.new }
          value_field :last_schedule_time
          value_field :last_successful_time

          validates :actives, array: { kind_of: KubeDSL::DSL::V1::ObjectReference }, presence: false
          validates :last_schedule_time, field: { format: :string }, presence: false
          validates :last_successful_time, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:active] = actives.map(&:serialize)
              result[:lastScheduleTime] = last_schedule_time
              result[:lastSuccessfulTime] = last_successful_time
            end
          end

          def kind_sym
            :cron_job_status
          end
        end
      end
    end
  end
end