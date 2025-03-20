# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceConversion < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def strategy(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Apiextensions::V1::WebhookConversion).void)).returns(KubeDSL::DSL::Apiextensions::V1::WebhookConversion) }
          def webhook(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def webhook_present?; end
        end
      end
    end
  end
end