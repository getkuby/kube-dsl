# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class NetworkPolicySpec < ::KubeDSL::DSLObject
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
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::NetworkPolicyEgressRule))
            ).returns(T::Array[KubeDSL::DSL::Networking::V1::NetworkPolicyEgressRule])
          }
          def egresses(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::NetworkPolicyIngressRule))
            ).returns(T::Array[KubeDSL::DSL::Networking::V1::NetworkPolicyIngressRule])
          }
          def ingresses(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def pod_selector; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def pod_selector_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def policy_types(val = nil); end
        end
      end
    end
  end
end