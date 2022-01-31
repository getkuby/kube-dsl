# typed: strict

module KubeDSL::DSL::Flowcontrol::V1beta1
  class ResourcePolicyRule < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def api_groups(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def cluster_scope(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def namespaces(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def resources(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def verbs(val = nil); end

  end
end
