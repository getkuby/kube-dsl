# typed: strict

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta1
        class FlowSchemaSpec < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::FlowDistinguisherMethod) }
          def distinguisher_method; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def matching_precedence(val = nil); end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationReference) }
          def priority_level_configuration; end

          sig {
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