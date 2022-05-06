# typed: strict

module KubeDSL
  module DSL
    module Events
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def action(val = nil); end


          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def deprecated_count(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def deprecated_first_timestamp(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def deprecated_last_timestamp(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::EventSource) }
          def deprecated_source; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def deprecated_source_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def event_time(val = nil); end


          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def metadata_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def note(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ObjectReference) }
          def regarding; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def regarding_present?; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ObjectReference) }
          def related; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def related_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def reporting_controller(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def reporting_instance(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Events::V1::EventSeries) }
          def series; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def series_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end
      end
    end
  end
end