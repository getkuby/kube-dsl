# typed: true

module KubeDSL
  module DSL
    module Batch
      module V1
        class JobList < ::KubeDSL::DSLObject
          array_field(:item) { KubeDSL::DSL::Batch::V1::Job.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

          validates :items, array: { kind_of: KubeDSL::DSL::Batch::V1::Job }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "batch/v1"
              result[:items] = items.map(&:serialize)
              result[:kind] = "JobList"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :job_list
          end
        end
      end
    end
  end
end