# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1alpha1
        class CSIStorageCapacity < ::KubeDSL::DSLObject
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
          def capacity(val = nil); end


          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def maximum_volume_size(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def metadata_present?; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def node_topology; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def node_topology_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def storage_class_name(val = nil); end
        end
      end
    end
  end
end