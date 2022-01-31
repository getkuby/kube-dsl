# typed: strict

module KubeDSL::DSL::Apiserverinternal::V1alpha1
  class StorageVersionStatus < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { params(val: T.nilable(String)).returns(String) }
    def common_encoding_version(val = nil); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionCondition))
      ).returns(T::Array[KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionCondition])
    }
    def conditions(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiserverinternal::V1alpha1::ServerStorageVersion))
      ).returns(T::Array[KubeDSL::DSL::Apiserverinternal::V1alpha1::ServerStorageVersion])
    }
    def storage_versions(elem_name = nil, &block); end

  end
end
