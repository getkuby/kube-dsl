# typed: strict

module KubeDSL
  module DSL
    module V1
      class ServiceSpec < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def allocate_load_balancer_node_ports(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def cluster_ip(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def cluster_i_ps(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def external_i_ps(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def external_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def external_traffic_policy(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def health_check_node_port(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def internal_traffic_policy(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def ip_families(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def ip_family_policy(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def load_balancer_class(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def load_balancer_ip(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def load_balancer_source_ranges(val = nil); end

        sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ServicePort))
          ).returns(T::Array[KubeDSL::DSL::V1::ServicePort])
        }
        def ports(elem_name = nil, &block); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def publish_not_ready_addresses(val = nil); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def selector(&block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def session_affinity(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SessionAffinityConfig) }
        def session_affinity_config; end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end
    end
  end
end