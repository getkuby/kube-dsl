# typed: strict

module KubeDSL
  module DSL
    module Apps
      module V1
        class DaemonSetStatus < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def collision_count(val = nil); end

          sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::DaemonSetCondition))
            ).returns(T::Array[KubeDSL::DSL::Apps::V1::DaemonSetCondition])
          }
          def conditions(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_number_scheduled(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def desired_number_scheduled(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_available(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_misscheduled(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_ready(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_unavailable(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def updated_number_scheduled(val = nil); end
        end
      end
    end
  end
end