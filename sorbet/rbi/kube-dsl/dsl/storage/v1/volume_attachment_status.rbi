# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1
        class VolumeAttachmentStatus < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Storage::V1::VolumeError) }
          def attach_error; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def attach_error_present?; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def attached(val = nil); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def attachment_metadata(&block); end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Storage::V1::VolumeError) }
          def detach_error; end
          
          T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
          def detach_error_present?; end
        end
      end
    end
  end
end