# typed: strict

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta1
        class LimitedPriorityLevelConfiguration < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def assured_concurrency_shares(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::LimitResponse) }
          def limit_response; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def limit_response_present?; end
        end
      end
    end
  end
end