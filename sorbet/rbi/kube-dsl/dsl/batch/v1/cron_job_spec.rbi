# typed: strict

module KubeDSL
  module DSL
    module Batch
      module V1
        class CronJobSpec < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def concurrency_policy(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def failed_jobs_history_limit(val = nil); end

          sig { returns(KubeDSL::DSL::Batch::V1::JobTemplateSpec) }
          def job_template; end

          sig { params(val: T.nilable(String)).returns(String) }
          def schedule(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def starting_deadline_seconds(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def successful_jobs_history_limit(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def suspend(val = nil); end
        end
      end
    end
  end
end