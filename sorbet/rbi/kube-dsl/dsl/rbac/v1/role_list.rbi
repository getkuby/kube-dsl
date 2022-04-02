# typed: strict

module KubeDSL
  module DSL
    module Rbac
      module V1
        class RoleList < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end


          sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1::Role))
            ).returns(T::Array[KubeDSL::DSL::Rbac::V1::Role])
          }
          def items(elem_name = nil, &block); end


          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end
      end
    end
  end
end