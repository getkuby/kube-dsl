# typed: strict

module KubeDSL::DSL::V1
  class ConfigMapNodeConfigSource < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def kubelet_config_key(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def name(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def namespace(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def resource_version(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def uid(val = nil); end

  end
end
