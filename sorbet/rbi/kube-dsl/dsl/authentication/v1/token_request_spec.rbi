# typed: strict

module KubeDSL
  module DSL
    module Authentication
      module V1
        class TokenRequestSpec < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def audiences(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Authentication::V1::BoundObjectReference).void)).returns(KubeDSL::DSL::Authentication::V1::BoundObjectReference) }
          def bound_object_ref(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def bound_object_ref_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def expiration_seconds(val = nil); end
        end
      end
    end
  end
end