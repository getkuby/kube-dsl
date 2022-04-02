# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class OwnerReference < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_version(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def block_owner_deletion(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def controller(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def uid(val = nil); end
        end
      end
    end
  end
end