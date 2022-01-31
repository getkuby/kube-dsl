# typed: strict

module KubeDSL::DSL::V1
  class PodSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def active_deadline_seconds(val = nil); end

    sig { returns(KubeDSL::DSL::V1::Affinity) }
    def affinity; end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def automount_service_account_token(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Container))
      ).returns(T::Array[KubeDSL::DSL::V1::Container])
    }
    def containers(elem_name = nil, &block); end

    sig { returns(KubeDSL::DSL::V1::PodDNSConfig) }
    def dns_config; end

    sig { params(val: T.nilable(String)).returns(String) }
    def dns_policy(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def enable_service_links(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EphemeralContainer))
      ).returns(T::Array[KubeDSL::DSL::V1::EphemeralContainer])
    }
    def ephemeral_containers(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::HostAlias))
      ).returns(T::Array[KubeDSL::DSL::V1::HostAlias])
    }
    def host_aliases(elem_name = nil, &block); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def host_ipc(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def host_network(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def host_pid(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def hostname(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::LocalObjectReference))
      ).returns(T::Array[KubeDSL::DSL::V1::LocalObjectReference])
    }
    def image_pull_secrets(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Container))
      ).returns(T::Array[KubeDSL::DSL::V1::Container])
    }
    def init_containers(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def node_name(val = nil); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def node_selector(&block); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def overhead(&block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def preemption_policy(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def priority(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def priority_class_name(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodReadinessGate))
      ).returns(T::Array[KubeDSL::DSL::V1::PodReadinessGate])
    }
    def readiness_gates(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def restart_policy(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def runtime_class_name(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def scheduler_name(val = nil); end

    sig { returns(KubeDSL::DSL::V1::PodSecurityContext) }
    def security_context; end

    sig { params(val: T.nilable(String)).returns(String) }
    def service_account(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def service_account_name(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def set_hostname_as_fqdn(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def share_process_namespace(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def subdomain(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def termination_grace_period_seconds(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Toleration))
      ).returns(T::Array[KubeDSL::DSL::V1::Toleration])
    }
    def tolerations(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::TopologySpreadConstraint))
      ).returns(T::Array[KubeDSL::DSL::V1::TopologySpreadConstraint])
    }
    def topology_spread_constraints(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Volume))
      ).returns(T::Array[KubeDSL::DSL::V1::Volume])
    }
    def volumes(elem_name = nil, &block); end

  end
end
