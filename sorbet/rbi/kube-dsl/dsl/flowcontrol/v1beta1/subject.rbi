# typed: strict

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta1
        class Subject < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::GroupSubject) }
          def group; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def group_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::ServiceAccountSubject) }
          def service_account; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def service_account_present?; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::UserSubject) }
          def user; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def user_present?; end
        end
      end
    end
  end
end