# typed: strict

module KubeDSL
  module DSL
    module Authentication
      module V1
        class TokenRequest < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end



          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Authentication::V1::TokenRequestSpec) }
          def spec; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Authentication::V1::TokenRequestStatus) }
          def status; end
        end
      end
    end
  end
end