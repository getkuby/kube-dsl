# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class GroupVersionForDiscovery < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def group_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def version(val = nil); end
        end
      end
    end
  end
end