# typed: strict

module KubeDSL
  module DSL
    module Authentication
      module V1
        class TokenReviewStatus < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def audiences(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def authenticated(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def error(val = nil); end

          sig { returns(KubeDSL::DSL::Authentication::V1::UserInfo) }
          def user; end
        end
      end
    end
  end
end