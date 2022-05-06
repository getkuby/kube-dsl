# typed: strict

module KubeDSL
  module DSL
    module V1
      class NodeStatus < ::KubeDSL::DSLObject
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
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::NodeAddress))
          ).returns(T::Array[KubeDSL::DSL::V1::NodeAddress])
        }
        def addresses(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def allocatable(&block); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def capacity(&block); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::NodeCondition))
          ).returns(T::Array[KubeDSL::DSL::V1::NodeCondition])
        }
        def conditions(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::NodeConfigStatus) }
        def config; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def config_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::NodeDaemonEndpoints) }
        def daemon_endpoints; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def daemon_endpoints_present?; end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerImage))
          ).returns(T::Array[KubeDSL::DSL::V1::ContainerImage])
        }
        def images(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::NodeSystemInfo) }
        def node_info; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def node_info_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def phase(val = nil); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::AttachedVolume))
          ).returns(T::Array[KubeDSL::DSL::V1::AttachedVolume])
        }
        def volumes_attacheds(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def volumes_in_use(val = nil); end
      end
    end
  end
end