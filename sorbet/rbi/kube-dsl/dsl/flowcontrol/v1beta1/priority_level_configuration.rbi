# typed: strict

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta1
        class PriorityLevelConfiguration < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end



          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationStatus) }
          def status; end
        end
      end
    end
  end
end