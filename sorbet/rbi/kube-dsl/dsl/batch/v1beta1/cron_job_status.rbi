# typed: strict

module KubeDSL
  module DSL
    module Batch
      module V1beta1
        class CronJobStatus < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ObjectReference))
            ).returns(T::Array[KubeDSL::DSL::V1::ObjectReference])
          }
          def actives(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_schedule_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_successful_time(val = nil); end
        end
      end
    end
  end
end