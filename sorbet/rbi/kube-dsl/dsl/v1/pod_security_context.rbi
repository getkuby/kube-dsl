# typed: strict

module KubeDSL
  module DSL
    module V1
      class PodSecurityContext < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def fs_group(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_group_change_policy(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def run_as_group(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def run_as_non_root(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def run_as_user(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SELinuxOptions) }
        def se_linux_options; end

        sig { returns(KubeDSL::DSL::V1::SeccompProfile) }
        def seccomp_profile; end

        sig { params(val: T.nilable(String)).returns(String) }
        def supplemental_groups(val = nil); end

        sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Sysctl))
          ).returns(T::Array[KubeDSL::DSL::V1::Sysctl])
        }
        def sysctlses(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::V1::WindowsSecurityContextOptions) }
        def windows_options; end
      end
    end
  end
end