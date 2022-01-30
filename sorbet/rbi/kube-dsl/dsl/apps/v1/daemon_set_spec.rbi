# typed: strict

module KubeDSL::DSL::Apps::V1
  class DaemonSetSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def min_ready_seconds(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def revision_history_limit(val = nil); end

    sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
    def selector; end

    sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
    def template; end

    sig { returns(KubeDSL::DSL::Apps::V1::DaemonSetUpdateStrategy) }
    def update_strategy; end

  end
end
