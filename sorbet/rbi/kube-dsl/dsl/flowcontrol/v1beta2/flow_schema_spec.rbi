# typed: strict

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta2
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Flowcontrol::V1beta2::FlowDistinguisherMethod).void)).returns(KubeDSL::DSL::Flowcontrol::V1beta2::FlowDistinguisherMethod) }
          def distinguisher_method(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def distinguisher_method_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def matching_precedence(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Flowcontrol::V1beta2::PriorityLevelConfigurationReference).void)).returns(KubeDSL::DSL::Flowcontrol::V1beta2::PriorityLevelConfigurationReference) }
          def priority_level_configuration(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def priority_level_configuration_present?; end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta2::PolicyRulesWithSubjects))
            ).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta2::PolicyRulesWithSubjects])
          }
          def rules(elem_name = nil, &block); end
        end
      end
    end
  end
end