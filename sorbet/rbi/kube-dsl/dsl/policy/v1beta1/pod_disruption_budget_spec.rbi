# typed: strict

module KubeDSL
  module DSL
    module Policy
      module V1beta1
        class PodDisruptionBudgetSpec < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def max_unavailable(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def min_available(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end
        end
      end
    end
  end
end