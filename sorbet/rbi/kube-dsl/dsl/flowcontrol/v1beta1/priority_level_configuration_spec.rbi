# typed: strict

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta1
        class PriorityLevelConfigurationSpec < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Flowcontrol::V1beta1::LimitedPriorityLevelConfiguration).void)).returns(KubeDSL::DSL::Flowcontrol::V1beta1::LimitedPriorityLevelConfiguration) }
          def limited(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def limited_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def type(val = nil); end
        end
      end
    end
  end
end