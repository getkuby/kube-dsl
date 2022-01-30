# typed: strict

module KubeDSL::DSL::V1
  class SecurityContext < ::KubeDSL::DSLObject
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

    sig { returns(KubeDSL::DSL::V1::Capabilities) }
    def capabilities; end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def privileged(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def proc_mount(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def read_only_root_filesystem(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def run_as_group(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def run_as_non_root(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def run_as_user(val = nil); end

    sig { returns(KubeDSL::DSL::V1::SELinuxOptions) }
    def se_linux_options; end

    sig { returns(KubeDSL::DSL::V1::WindowsSecurityContextOptions) }
    def windows_options; end

  end
end
