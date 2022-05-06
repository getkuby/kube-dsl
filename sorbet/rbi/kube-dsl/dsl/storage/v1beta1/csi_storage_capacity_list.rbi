# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1beta1
        class CSIStorageCapacityList < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end


          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Storage::V1beta1::CSIStorageCapacity))
            ).returns(T::Array[KubeDSL::DSL::Storage::V1beta1::CSIStorageCapacity])
          }
          def items(elem_name = nil, &block); end


          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end
      end
    end
  end
end