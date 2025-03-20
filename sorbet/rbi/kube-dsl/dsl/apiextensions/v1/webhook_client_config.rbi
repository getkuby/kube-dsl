# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class WebhookClientConfig < ::KubeDSL::DSLObject
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
          def ca_bundle(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Apiextensions::V1::ServiceReference).void)).returns(KubeDSL::DSL::Apiextensions::V1::ServiceReference) }
          def service(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def service_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def url(val = nil); end
        end
      end
    end
  end
end