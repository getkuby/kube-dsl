# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class NetworkPolicyPeer < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Networking::V1::IPBlock).void)).returns(KubeDSL::DSL::Networking::V1::IPBlock) }
          def ip_block(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def ip_block_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Meta::V1::LabelSelector).void)).returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def namespace_selector(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def namespace_selector_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Meta::V1::LabelSelector).void)).returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def pod_selector(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def pod_selector_present?; end
        end
      end
    end
  end
end