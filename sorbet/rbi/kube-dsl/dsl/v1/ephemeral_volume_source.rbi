# typed: strict

module KubeDSL
  module DSL
    module V1
      class EphemeralVolumeSource < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::PersistentVolumeClaimTemplate) }
        def volume_claim_template; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def volume_claim_template_present?; end
      end
    end
  end
end