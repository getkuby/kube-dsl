# typed: strict

module KubeDSL
  module DSL
    module Policy
      module V1beta1
        class PodSecurityPolicy < ::KubeDSL::DSLObject
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



          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def metadata_present?; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Policy::V1beta1::PodSecurityPolicySpec) }
          def spec; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def spec_present?; end
        end
      end
    end
  end
end