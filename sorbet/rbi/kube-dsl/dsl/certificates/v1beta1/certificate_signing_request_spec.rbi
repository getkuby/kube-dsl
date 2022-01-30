# typed: strict

module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequestSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def extra(&block); end

    sig { params(val: T.nilable(String)).returns(String) }
    def groups(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def request(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def uid(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def usages(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def username(val = nil); end

  end
end
