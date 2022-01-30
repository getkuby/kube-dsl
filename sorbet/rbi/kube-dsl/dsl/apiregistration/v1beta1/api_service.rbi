# typed: strict

module KubeDSL::DSL::Apiregistration::V1beta1
  class APIService < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
    def metadata; end

    sig { returns(KubeDSL::DSL::Apiregistration::V1beta1::APIServiceSpec) }
    def spec; end

    sig { returns(KubeDSL::DSL::Apiregistration::V1beta1::APIServiceStatus) }
    def status; end

  end
end