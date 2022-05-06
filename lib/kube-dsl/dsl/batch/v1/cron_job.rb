# typed: strict

module KubeDSL
  module DSL
    module Batch
      module V1
        class CronJob < ::KubeDSL::DSLObject
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          object_field(:spec) { KubeDSL::DSL::Batch::V1::CronJobSpec.new }
          object_field(:status) { KubeDSL::DSL::Batch::V1::CronJobStatus.new }

          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :spec, object: { kind_of: KubeDSL::DSL::Batch::V1::CronJobSpec }
          validates :status, object: { kind_of: KubeDSL::DSL::Batch::V1::CronJobStatus }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "batch/v1"
              result[:kind] = "CronJob"
              result[:metadata] = metadata.serialize
              result[:spec] = spec.serialize
              result[:status] = status.serialize
            end
          end

          def kind_sym
            :cron_job
          end
        end
      end
    end
  end
end