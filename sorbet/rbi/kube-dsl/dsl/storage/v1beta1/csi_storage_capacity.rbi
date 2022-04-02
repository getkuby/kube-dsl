# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1beta1
        class CSIStorageCapacity < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end


          sig { params(val: T.nilable(String)).returns(String) }
          def capacity(val = nil); end


          sig { params(val: T.nilable(String)).returns(String) }
          def maximum_volume_size(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def node_topology; end

          sig { params(val: T.nilable(String)).returns(String) }
          def storage_class_name(val = nil); end
        end
      end
    end
  end
end