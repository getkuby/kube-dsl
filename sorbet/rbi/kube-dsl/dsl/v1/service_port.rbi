# typed: strict

module KubeDSL::DSL::V1
  class ServicePort < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def name(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def node_port(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def port(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def protocol(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def target_port(val = nil); end

  end
end
