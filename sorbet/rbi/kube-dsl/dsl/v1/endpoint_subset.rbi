# typed: strict

module KubeDSL
  module DSL
    module V1
      class EndpointSubset < ::KubeDSL::DSLObject
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
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EndpointAddress))
          ).returns(T::Array[KubeDSL::DSL::V1::EndpointAddress])
        }
        def addresses(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EndpointAddress))
          ).returns(T::Array[KubeDSL::DSL::V1::EndpointAddress])
        }
        def not_ready_addresses(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EndpointPort))
          ).returns(T::Array[KubeDSL::DSL::V1::EndpointPort])
        }
        def ports(elem_name = nil, &block); end
      end
    end
  end
end