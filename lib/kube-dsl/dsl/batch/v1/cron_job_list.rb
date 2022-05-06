# typed: strict

module KubeDSL
  module DSL
    module Batch
      module V1
        class CronJobList < ::KubeDSL::DSLObject
          array_field(:item) { KubeDSL::DSL::Batch::V1::CronJob.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

          validates :items, array: { kind_of: KubeDSL::DSL::Batch::V1::CronJob }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "batch/v1"
              result[:items] = items.map(&:serialize)
              result[:kind] = "CronJobList"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :cron_job_list
          end
        end
      end
    end
  end
end