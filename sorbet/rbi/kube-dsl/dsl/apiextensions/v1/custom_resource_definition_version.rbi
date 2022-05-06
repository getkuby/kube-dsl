# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceDefinitionVersion < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceColumnDefinition))
            ).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::CustomResourceColumnDefinition])
          }
          def additional_printer_columns(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def deprecated(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def deprecation_warning(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceValidation) }
          def schema; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def schema_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def served(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def storage(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresources) }
          def subresources; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def subresources_present?; end
        end
      end
    end
  end
end