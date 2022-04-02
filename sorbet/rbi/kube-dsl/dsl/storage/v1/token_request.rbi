# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1
        class TokenRequest < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def audience(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def expiration_seconds(val = nil); end
        end
      end
    end
  end
end