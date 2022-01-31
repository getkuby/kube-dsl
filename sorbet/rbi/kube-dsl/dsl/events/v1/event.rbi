# typed: strict

module KubeDSL::DSL::Events::V1
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
    def deprecated_count(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def deprecated_first_timestamp(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def deprecated_last_timestamp(val = nil); end

    sig { returns(KubeDSL::DSL::V1::EventSource) }
    def deprecated_source; end

    sig { params(val: T.nilable(String)).returns(String) }
    def event_time(val = nil); end

    sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
    def metadata; end

    sig { params(val: T.nilable(String)).returns(String) }
    def note(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def reason(val = nil); end

    sig { returns(KubeDSL::DSL::V1::ObjectReference) }
    def regarding; end

    sig { returns(KubeDSL::DSL::V1::ObjectReference) }
    def related; end

    sig { params(val: T.nilable(String)).returns(String) }
    def reporting_controller(val = nil); end

    sig { params(val: T.nilable(String)).returns(String) }
    def reporting_instance(val = nil); end

    sig { returns(KubeDSL::DSL::Events::V1::EventSeries) }
    def series; end

    sig { params(val: T.nilable(String)).returns(String) }
    def type(val = nil); end

  end
end
