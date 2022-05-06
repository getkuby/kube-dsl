# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class ObjectMeta < ::KubeDSL::DSLObject
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
          def annotations(&block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def cluster_name(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def creation_timestamp(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def deletion_grace_period_seconds(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def deletion_timestamp(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def finalizers(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def generate_name(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
          def generation(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def labels(&block); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::ManagedFieldsEntry))
            ).returns(T::Array[KubeDSL::DSL::Meta::V1::ManagedFieldsEntry])
          }
          def managed_fields(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::OwnerReference))
            ).returns(T::Array[KubeDSL::DSL::Meta::V1::OwnerReference])
          }
          def owner_references(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def resource_version(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def self_link(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def uid(val = nil); end
        end
      end
    end
  end
end