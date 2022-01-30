# typed: strict

module KubeDSL::DSL::V1
  class NodeStatus < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::NodeAddress))
      ).returns(T::Array[KubeDSL::DSL::V1::NodeAddress])
    }
    def addresses(elem_name = nil, &block); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def allocatable(&block); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def capacity(&block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::NodeCondition))
      ).returns(T::Array[KubeDSL::DSL::V1::NodeCondition])
    }
    def conditions(elem_name = nil, &block); end

    sig { returns(KubeDSL::DSL::V1::NodeConfigStatus) }
    def config; end

    sig { returns(KubeDSL::DSL::V1::NodeDaemonEndpoints) }
    def daemon_endpoints; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerImage))
      ).returns(T::Array[KubeDSL::DSL::V1::ContainerImage])
    }
    def images(elem_name = nil, &block); end

    sig { returns(KubeDSL::DSL::V1::NodeSystemInfo) }
    def node_info; end

    sig { params(val: T.nilable(String)).returns(String) }
    def phase(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::AttachedVolume))
      ).returns(T::Array[KubeDSL::DSL::V1::AttachedVolume])
    }
    def volumes_attacheds(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def volumes_in_use(val = nil); end

  end
end
