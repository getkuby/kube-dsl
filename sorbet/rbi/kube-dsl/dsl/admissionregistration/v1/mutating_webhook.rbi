# typed: strict

module KubeDSL
  module DSL
    module Admissionregistration
      module V1
        class MutatingWebhook < ::KubeDSL::DSLObject
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
          def admission_review_versions(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Admissionregistration::V1::WebhookClientConfig).void)).returns(KubeDSL::DSL::Admissionregistration::V1::WebhookClientConfig) }
          def client_config(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def client_config_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def failure_policy(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def match_policy(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def name(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Meta::V1::LabelSelector).void)).returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def namespace_selector(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def namespace_selector_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Meta::V1::LabelSelector).void)).returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def object_selector(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def object_selector_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def reinvocation_policy(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations))
            ).returns(T::Array[KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations])
          }
          def rules(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def side_effects(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(T.nilable(Integer)) }
          def timeout_seconds(val = nil); end
        end
      end
    end
  end
end