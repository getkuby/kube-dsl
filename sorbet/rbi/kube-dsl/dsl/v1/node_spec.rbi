# typed: strict

module KubeDSL::DSL::V1
  class NodeSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::V1::NodeConfigSource) }
    def config_source; end

    sig { params(val: T.nilable(String)).returns(String) }
    def external_id(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def pod_cidr(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def pod_cid_rs(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def provider_id(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Taint))
      ).returns(T::Array[KubeDSL::DSL::V1::Taint])
    }
    def taints(elem_name = nil, &block); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def unschedulable(val = nil); end

  end
end
