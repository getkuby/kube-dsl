# typed: strict

module KubeDSL
  module DSL
    module Batch
      module V1
        class JobStatus < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def active(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def completed_indexes(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def completion_time(val = nil); end

          sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Batch::V1::JobCondition))
            ).returns(T::Array[KubeDSL::DSL::Batch::V1::JobCondition])
          }
          def conditions(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def failed(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def start_time(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def succeeded(val = nil); end

          sig { returns(KubeDSL::DSL::Batch::V1::UncountedTerminatedPods) }
          def uncounted_terminated_pods; end
        end
      end
    end
  end
end