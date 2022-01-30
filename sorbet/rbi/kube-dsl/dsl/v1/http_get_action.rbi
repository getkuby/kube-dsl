# typed: strict

module KubeDSL::DSL::V1
  class HTTPGetAction < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def host(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::HTTPHeader))
      ).returns(T::Array[KubeDSL::DSL::V1::HTTPHeader])
    }
    def http_headers(elem_name = nil, &block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def path(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def port(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def scheme(val = nil); end

  end
end
