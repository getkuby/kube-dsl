# typed: strict

module KubeDSL::DSL::Certificates::V1
  class CertificateSigningRequestStatus < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def certificate(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Certificates::V1::CertificateSigningRequestCondition))
      ).returns(T::Array[KubeDSL::DSL::Certificates::V1::CertificateSigningRequestCondition])
    }
    def conditions(elem_name = nil, &block); end

  end
end
