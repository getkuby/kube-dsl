# typed: strict

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta1
        class FlowSchemaSpec < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::FlowDistinguisherMethod) }
          def distinguisher_method; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def distinguisher_method_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def matching_precedence(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationReference) }
          def priority_level_configuration; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def priority_level_configuration_present?; end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta1::PolicyRulesWithSubjects))
            ).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta1::PolicyRulesWithSubjects])
          }
          def rules(elem_name = nil, &block); end
        end
      end
    end
  end
end