# typed: strict

module KubeDSL
  module DSL
    module Batch
      module V1
        class JobSpec < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def active_deadline_seconds(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def backoff_limit(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def completion_mode(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def completions(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def manual_selector(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def parallelism(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def selector_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def suspend(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
          def template; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def template_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def ttl_seconds_after_finished(val = nil); end
        end
      end
    end
  end
end