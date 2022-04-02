# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1alpha1
        class VolumeAttachment < ::KubeDSL::DSLObject
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

          sig { returns(KubeDSL::DSL::Storage::V1alpha1::VolumeAttachmentSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Storage::V1alpha1::VolumeAttachmentStatus) }
          def status; end
        end
      end
    end
  end
end