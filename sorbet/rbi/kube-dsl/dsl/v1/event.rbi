# typed: strict

module KubeDSL
  module DSL
    module V1
      class Event < ::KubeDSL::DSLObject
        extend KubeDSL::ValueFields::ClassMethods
        extend KubeDSL::Validations::ClassMethods
        include KubeDSL::ValueFields::InstanceMethods

        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def action(val = nil); end


        T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def count(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def event_time(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def first_timestamp(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ObjectReference).void)).returns(KubeDSL::DSL::V1::ObjectReference) }
        def involved_object(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def involved_object_present?; end


        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def last_timestamp(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def message(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Meta::V1::ObjectMeta).void)).returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def metadata_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def reason(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ObjectReference).void)).returns(KubeDSL::DSL::V1::ObjectReference) }
        def related(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def related_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def reporting_component(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def reporting_instance(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::EventSeries).void)).returns(KubeDSL::DSL::V1::EventSeries) }
        def series(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def series_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::EventSource).void)).returns(KubeDSL::DSL::V1::EventSource) }
        def source(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def source_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def type(val = nil); end
      end
    end
  end
end