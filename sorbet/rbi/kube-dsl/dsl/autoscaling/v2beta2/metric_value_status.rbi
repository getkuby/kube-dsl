# typed: strict

module KubeDSL::DSL::Autoscaling::V2beta2
  class MetricValueStatus < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def average_utilization(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def average_value(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def value(val = nil); end

  end
end
