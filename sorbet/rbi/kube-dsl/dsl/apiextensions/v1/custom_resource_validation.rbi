# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceValidation < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps) }
          def open_apiv3_schema; end
        end
      end
    end
  end
end