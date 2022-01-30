# typed: strict

module KubeDSL::DSL::V1
  class PodStatus < ::KubeDSL::DSLObject
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
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodCondition))
      ).returns(T::Array[KubeDSL::DSL::V1::PodCondition])
    }
    def conditions(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerStatus))
      ).returns(T::Array[KubeDSL::DSL::V1::ContainerStatus])
    }
    def container_statuses(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerStatus))
      ).returns(T::Array[KubeDSL::DSL::V1::ContainerStatus])
    }
    def ephemeral_container_statuses(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def host_ip(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerStatus))
      ).returns(T::Array[KubeDSL::DSL::V1::ContainerStatus])
    }
    def init_container_statuses(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def message(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def nominated_node_name(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def phase(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def pod_ip(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodIP))
      ).returns(T::Array[KubeDSL::DSL::V1::PodIP])
    }
    def pod_ips(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def qos_class(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def reason(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def start_time(val = nil); end

  end
end
