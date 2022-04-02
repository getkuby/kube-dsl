# typed: strict

module KubeDSL
  module DSL
    module Policy
      module V1beta1
        class PodSecurityPolicySpec < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def allow_privilege_escalation(val = nil); end

          sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::AllowedCSIDriver))
            ).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::AllowedCSIDriver])
          }
          def allowed_csi_drivers(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def allowed_capabilities(val = nil); end

          sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::AllowedFlexVolume))
            ).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::AllowedFlexVolume])
          }
          def allowed_flex_volumes(elem_name = nil, &block); end

          sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::AllowedHostPath))
            ).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::AllowedHostPath])
          }
          def allowed_host_paths(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def allowed_proc_mount_types(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def allowed_unsafe_sysctls(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def default_add_capabilities(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def default_allow_privilege_escalation(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def forbidden_sysctls(val = nil); end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::FSGroupStrategyOptions) }
          def fs_group; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def host_ipc(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def host_network(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def host_pid(val = nil); end

          sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::HostPortRange))
            ).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::HostPortRange])
          }
          def host_ports(elem_name = nil, &block); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def privileged(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def read_only_root_filesystem(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def required_drop_capabilities(val = nil); end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::RunAsGroupStrategyOptions) }
          def run_as_group; end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::RunAsUserStrategyOptions) }
          def run_as_user; end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::RuntimeClassStrategyOptions) }
          def runtime_class; end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::SELinuxStrategyOptions) }
          def se_linux; end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::SupplementalGroupsStrategyOptions) }
          def supplemental_groups; end

          sig { params(val: T.nilable(String)).returns(String) }
          def volumes(val = nil); end
        end
      end
    end
  end
end