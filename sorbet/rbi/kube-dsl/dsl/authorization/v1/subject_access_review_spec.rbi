# typed: strict

module KubeDSL
  module DSL
    module Authorization
      module V1
        class SubjectAccessReviewSpec < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def extra(&block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def groups(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Authorization::V1::NonResourceAttributes) }
          def non_resource_attributes; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def non_resource_attributes_present?; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Authorization::V1::ResourceAttributes) }
          def resource_attributes; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def resource_attributes_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def uid(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def user(val = nil); end
        end
      end
    end
  end
end