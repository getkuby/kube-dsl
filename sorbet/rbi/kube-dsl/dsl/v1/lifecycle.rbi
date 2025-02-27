# typed: strict

module KubeDSL
  module DSL
    module V1
      class Lifecycle < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::LifecycleHandler) }
        def post_start; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def post_start_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::LifecycleHandler) }
        def pre_stop; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def pre_stop_present?; end
      end
    end
  end
end