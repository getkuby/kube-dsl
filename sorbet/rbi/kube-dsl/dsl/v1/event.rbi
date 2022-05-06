# typed: strict

module KubeDSL
  module DSL
    module V1
      class Event < ::KubeDSL::DSLObject
        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def action(val = nil); end


        T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
        def count(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def event_time(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def first_timestamp(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ObjectReference) }
        def involved_object; end


        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def last_timestamp(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def reason(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ObjectReference) }
        def related; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def reporting_component(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def reporting_instance(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::EventSeries) }
        def series; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::EventSource) }
        def source; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end
    end
  end
end