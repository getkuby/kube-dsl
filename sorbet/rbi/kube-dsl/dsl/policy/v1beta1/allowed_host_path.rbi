# typed: strict

module KubeDSL
  module DSL
    module Policy
      module V1beta1
        class AllowedHostPath < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def path_prefix(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def read_only(val = nil); end
        end
      end
    end
  end
end