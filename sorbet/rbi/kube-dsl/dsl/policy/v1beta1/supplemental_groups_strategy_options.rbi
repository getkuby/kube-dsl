# typed: strict

module KubeDSL
  module DSL
    module Policy
      module V1beta1
        class SupplementalGroupsStrategyOptions < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::IDRange))
            ).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::IDRange])
          }
          def ranges(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def rule(val = nil); end
        end
      end
    end
  end
end