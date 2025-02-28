# typed: strict

module KubeDSL
  module DSL
    module V1
      class EphemeralContainer < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def args(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def command(val = nil); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EnvVar))
          ).returns(T::Array[KubeDSL::DSL::V1::EnvVar])
        }
        def envs(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EnvFromSource))
          ).returns(T::Array[KubeDSL::DSL::V1::EnvFromSource])
        }
        def env_froms(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def image(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def image_pull_policy(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::Lifecycle).void)).returns(KubeDSL::DSL::V1::Lifecycle) }
        def lifecycle(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def lifecycle_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::Probe).void)).returns(KubeDSL::DSL::V1::Probe) }
        def liveness_probe(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def liveness_probe_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerPort))
          ).returns(T::Array[KubeDSL::DSL::V1::ContainerPort])
        }
        def ports(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::Probe).void)).returns(KubeDSL::DSL::V1::Probe) }
        def readiness_probe(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def readiness_probe_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ResourceRequirements).void)).returns(KubeDSL::DSL::V1::ResourceRequirements) }
        def resources(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def resources_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::SecurityContext).void)).returns(KubeDSL::DSL::V1::SecurityContext) }
        def security_context(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def security_context_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::Probe).void)).returns(KubeDSL::DSL::V1::Probe) }
        def startup_probe(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def startup_probe_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def stdin(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def stdin_once(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def target_container_name(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def termination_message_path(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def termination_message_policy(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def tty(val = nil); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::VolumeDevice))
          ).returns(T::Array[KubeDSL::DSL::V1::VolumeDevice])
        }
        def volume_devices(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::VolumeMount))
          ).returns(T::Array[KubeDSL::DSL::V1::VolumeMount])
        }
        def volume_mounts(elem_name = nil, &block); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def working_dir(val = nil); end
      end
    end
  end
end