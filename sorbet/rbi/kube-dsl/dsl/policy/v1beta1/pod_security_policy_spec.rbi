# typed: strict

module KubeDSL
  module DSL
    module Policy
      module V1beta1
        class PodSecurityPolicySpec < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
          def allow_privilege_escalation(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::AllowedCSIDriver))
            ).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::AllowedCSIDriver])
          }
          def allowed_csi_drivers(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def allowed_capabilities(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::AllowedFlexVolume))
            ).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::AllowedFlexVolume])
          }
          def allowed_flex_volumes(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::AllowedHostPath))
            ).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::AllowedHostPath])
          }
          def allowed_host_paths(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def allowed_proc_mount_types(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def allowed_unsafe_sysctls(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def default_add_capabilities(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
          def default_allow_privilege_escalation(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def forbidden_sysctls(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Policy::V1beta1::FSGroupStrategyOptions).void)).returns(KubeDSL::DSL::Policy::V1beta1::FSGroupStrategyOptions) }
          def fs_group(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def fs_group_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
          def host_ipc(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
          def host_network(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
          def host_pid(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::HostPortRange))
            ).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::HostPortRange])
          }
          def host_ports(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
          def privileged(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
          def read_only_root_filesystem(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def required_drop_capabilities(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Policy::V1beta1::RunAsGroupStrategyOptions).void)).returns(KubeDSL::DSL::Policy::V1beta1::RunAsGroupStrategyOptions) }
          def run_as_group(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def run_as_group_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Policy::V1beta1::RunAsUserStrategyOptions).void)).returns(KubeDSL::DSL::Policy::V1beta1::RunAsUserStrategyOptions) }
          def run_as_user(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def run_as_user_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Policy::V1beta1::RuntimeClassStrategyOptions).void)).returns(KubeDSL::DSL::Policy::V1beta1::RuntimeClassStrategyOptions) }
          def runtime_class(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def runtime_class_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Policy::V1beta1::SELinuxStrategyOptions).void)).returns(KubeDSL::DSL::Policy::V1beta1::SELinuxStrategyOptions) }
          def se_linux(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def se_linux_present?; end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Policy::V1beta1::SupplementalGroupsStrategyOptions).void)).returns(KubeDSL::DSL::Policy::V1beta1::SupplementalGroupsStrategyOptions) }
          def supplemental_groups(&block); end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def supplemental_groups_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
          def volumes(val = nil); end
        end
      end
    end
  end
end