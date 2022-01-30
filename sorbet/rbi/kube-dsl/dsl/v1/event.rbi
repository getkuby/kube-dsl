# typed: strict

module KubeDSL::DSL::V1
  class Event < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def action(val = nil); end

    sig { params(val: T.nilable(Integer)).returns(Integer) }
    def count(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def event_time(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def first_timestamp(val = nil); end

    sig { returns(KubeDSL::DSL::V1::ObjectReference) }
    def involved_object; end

    sig { params(val: T.nilable(String)).returns(String) }
    def last_timestamp(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def message(val = nil); end

    sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
    def metadata; end

    sig { params(val: T.nilable(String)).returns(String) }
    def reason(val = nil); end

    sig { returns(KubeDSL::DSL::V1::ObjectReference) }
    def related; end

    sig { params(val: T.nilable(String)).returns(String) }
    def reporting_component(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def reporting_instance(val = nil); end

    sig { returns(KubeDSL::DSL::V1::EventSeries) }
    def series; end

    sig { returns(KubeDSL::DSL::V1::EventSource) }
    def source; end

    sig { params(val: T.nilable(String)).returns(String) }
    def type(val = nil); end

  end
end
