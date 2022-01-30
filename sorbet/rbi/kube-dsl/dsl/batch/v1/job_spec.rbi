# typed: strict

module KubeDSL::DSL::Batch::V1
  class JobSpec < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def active_deadline_seconds(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def backoff_limit(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def completions(val = nil); end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def manual_selector(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def parallelism(val = nil); end

    sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
    def selector; end

    sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
    def template; end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def ttl_seconds_after_finished(val = nil); end

  end
end
