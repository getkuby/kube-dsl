# typed: strict

module KubeDSL::DSL::Apps::V1
  class DaemonSet < ::KubeDSL::DSLObject
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

    sig { returns(KubeDSL::DSL::Apps::V1::DaemonSetSpec) }
    def spec; end

    sig { returns(KubeDSL::DSL::Apps::V1::DaemonSetStatus) }
    def status; end

  end
end
