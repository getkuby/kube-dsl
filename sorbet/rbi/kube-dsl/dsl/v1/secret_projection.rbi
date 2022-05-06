# typed: strict

module KubeDSL
  module DSL
    module V1
      class SecretProjection < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::KeyToPath))
          ).returns(T::Array[KubeDSL::DSL::V1::KeyToPath])
        }
        def items(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def optional(val = nil); end
      end
    end
  end
end