# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1
        class TokenRequest < ::KubeDSL::DSLObject
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
          def audience(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def expiration_seconds(val = nil); end
        end
      end
    end
  end
end