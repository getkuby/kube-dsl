# typed: strict

module KubeDSL
  module DSL
    module Apiserverinternal
      module V1alpha1
        class StorageVersion < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end



          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(val: T.nilable(String)).returns(String) }
          def spec(val = nil); end

          sig { returns(KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionStatus) }
          def status; end
        end
      end
    end
  end
end