# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceDefinitionStatus < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames) }
          def accepted_names; end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionCondition))
            ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionCondition])
          }
          def conditions(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def stored_versions(val = nil); end
        end
      end
    end
  end
end