# typed: strict

module KubeDSL::DSL::V1
  class NodeSystemInfo < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def architecture(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def boot_id(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def container_runtime_version(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def kernel_version(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def kube_proxy_version(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def kubelet_version(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def machine_id(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def operating_system(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def os_image(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def system_uuid(val = nil); end

  end
end
