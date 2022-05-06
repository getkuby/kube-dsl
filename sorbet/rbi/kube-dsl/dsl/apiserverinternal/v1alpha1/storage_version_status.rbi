# typed: strict

module KubeDSL
  module DSL
    module Apiserverinternal
      module V1alpha1
        class StorageVersionStatus < ::KubeDSL::DSLObject
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
          def common_encoding_version(val = nil); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionCondition))
            ).returns(T::Array[KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionCondition])
          }
          def conditions(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiserverinternal::V1alpha1::ServerStorageVersion))
            ).returns(T::Array[KubeDSL::DSL::Apiserverinternal::V1alpha1::ServerStorageVersion])
          }
          def storage_versions(elem_name = nil, &block); end
        end
      end
    end
  end
end