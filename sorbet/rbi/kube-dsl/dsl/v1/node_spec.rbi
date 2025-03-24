# typed: strict

module KubeDSL
  module DSL
    module V1
      class NodeSpec < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::NodeConfigSource).void)).returns(KubeDSL::DSL::V1::NodeConfigSource) }
        def config_source(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def config_source_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def external_id(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def pod_cidr(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def pod_cid_rs(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def provider_id(val = nil); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Taint))
          ).returns(T::Array[KubeDSL::DSL::V1::Taint])
        }
        def taints(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
        def unschedulable(val = nil); end
      end
    end
  end
end