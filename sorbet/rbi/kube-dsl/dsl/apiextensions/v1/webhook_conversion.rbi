# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class WebhookConversion < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Apiextensions::V1::WebhookClientConfig).void)).returns(KubeDSL::DSL::Apiextensions::V1::WebhookClientConfig) }
          def client_config(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def client_config_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def conversion_review_versions(val = nil); end
        end
      end
    end
  end
end