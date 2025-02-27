# typed: strict

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta2
        class PolicyRulesWithSubjects < ::KubeDSL::DSLObject
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
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta2::NonResourcePolicyRule))
            ).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta2::NonResourcePolicyRule])
          }
          def non_resource_rules(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta2::ResourcePolicyRule))
            ).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta2::ResourcePolicyRule])
          }
          def resource_rules(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta2::Subject))
            ).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta2::Subject])
          }
          def subjects(elem_name = nil, &block); end
        end
      end
    end
  end
end