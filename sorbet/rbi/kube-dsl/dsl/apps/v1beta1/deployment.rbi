# typed: strict

module KubeDSL::DSL::Apps::V1beta1
  class Deployment < ::KubeDSL::DSLObject
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

    sig { returns(KubeDSL::DSL::Apps::V1beta1::DeploymentSpec) }
    def spec; end

    sig { returns(KubeDSL::DSL::Apps::V1beta1::DeploymentStatus) }
    def status; end

  end
end