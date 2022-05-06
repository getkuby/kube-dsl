# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class ExternalDocumentation < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def description(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def url(val = nil); end
        end
      end
    end
  end
end