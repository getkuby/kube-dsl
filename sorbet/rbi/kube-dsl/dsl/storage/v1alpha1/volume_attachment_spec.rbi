# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1alpha1
        class VolumeAttachmentSpec < ::KubeDSL::DSLObject
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
          def attacher(val = nil); end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def node_name(val = nil); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Storage::V1alpha1::VolumeAttachmentSource) }
          def source; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def source_present?; end
        end
      end
    end
  end
end