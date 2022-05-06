# typed: strict

module KubeDSL
  module DSL
    module V1
      class ConfigMapList < ::KubeDSL::DSLObject
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
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ConfigMap))
          ).returns(T::Array[KubeDSL::DSL::V1::ConfigMap])
        }
        def items(elem_name = nil, &block); end


        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def metadata_present?; end
      end
    end
  end
end