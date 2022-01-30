# typed: strict

module KubeDSL::DSL::Autoscaling::V1
  class Scale < ::KubeDSL::DSLObject
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

    sig { returns(KubeDSL::DSL::Autoscaling::V1::ScaleSpec) }
    def spec; end

    sig { returns(KubeDSL::DSL::Autoscaling::V1::ScaleStatus) }
    def status; end

  end
end
