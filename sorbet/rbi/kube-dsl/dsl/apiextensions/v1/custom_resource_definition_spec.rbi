# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceDefinitionSpec < ::KubeDSL::DSLObject
          extend KubeDSL::ValueFields::ClassMethods
          extend KubeDSL::Validations::ClassMethods
          include KubeDSL::ValueFields::InstanceMethods

          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Apiextensions::V1::CustomResourceConversion).void)).returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceConversion) }
          def conversion(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def conversion_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def group(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames).void)).returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames) }
          def names(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def names_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
          def preserve_unknown_fields(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def scope(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionVersion))
            ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionVersion])
          }
          def versions(elem_name = nil, &block); end
        end
      end
    end
  end
end