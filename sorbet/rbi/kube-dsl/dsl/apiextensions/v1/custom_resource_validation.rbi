# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceValidation < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps) }
          def open_apiv3_schema; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def open_apiv3_schema_present?; end
        end
      end
    end
  end
end