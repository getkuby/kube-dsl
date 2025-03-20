# typed: strict

module KubeDSL
  module DSL
    module V1
      class SecurityContext < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::Capabilities).void)).returns(KubeDSL::DSL::V1::Capabilities) }
        def capabilities(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def capabilities_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
        def privileged(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def proc_mount(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
        def read_only_root_filesystem(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def run_as_group(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T.nilable(T::Boolean)) }
        def run_as_non_root(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def run_as_user(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::SELinuxOptions).void)).returns(KubeDSL::DSL::V1::SELinuxOptions) }
        def se_linux_options(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def se_linux_options_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::SeccompProfile).void)).returns(KubeDSL::DSL::V1::SeccompProfile) }
        def seccomp_profile(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def seccomp_profile_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::WindowsSecurityContextOptions).void)).returns(KubeDSL::DSL::V1::WindowsSecurityContextOptions) }
        def windows_options(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def windows_options_present?; end
      end
    end
  end
end