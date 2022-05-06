# typed: strict

module KubeDSL
  module DSL
    module Policy
      module V1beta1
        class SELinuxStrategyOptions < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def rule(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::SELinuxOptions) }
          def se_linux_options; end
        end
      end
    end
  end
end