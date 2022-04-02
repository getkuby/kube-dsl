# typed: strict

module KubeDSL
  module DSL
    module V1
      class Container < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def args(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def command(val = nil); end

        sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EnvVar))
          ).returns(T::Array[KubeDSL::DSL::V1::EnvVar])
        }
        def envs(elem_name = nil, &block); end

        sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EnvFromSource))
          ).returns(T::Array[KubeDSL::DSL::V1::EnvFromSource])
        }
        def env_froms(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def image(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def image_pull_policy(val = nil); end

        sig { returns(KubeDSL::DSL::V1::Lifecycle) }
        def lifecycle; end

        sig { returns(KubeDSL::DSL::V1::Probe) }
        def liveness_probe; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerPort))
          ).returns(T::Array[KubeDSL::DSL::V1::ContainerPort])
        }
        def ports(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::V1::Probe) }
        def readiness_probe; end

        sig { returns(KubeDSL::DSL::V1::ResourceRequirements) }
        def resources; end

        sig { returns(KubeDSL::DSL::V1::SecurityContext) }
        def security_context; end

        sig { returns(KubeDSL::DSL::V1::Probe) }
        def startup_probe; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def stdin(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def stdin_once(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def termination_message_path(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def termination_message_policy(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def tty(val = nil); end

        sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::VolumeDevice))
          ).returns(T::Array[KubeDSL::DSL::V1::VolumeDevice])
        }
        def volume_devices(elem_name = nil, &block); end

        sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::VolumeMount))
          ).returns(T::Array[KubeDSL::DSL::V1::VolumeMount])
        }
        def volume_mounts(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def working_dir(val = nil); end
      end
    end
  end
end