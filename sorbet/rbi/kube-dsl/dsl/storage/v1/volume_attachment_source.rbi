# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1
        class VolumeAttachmentSource < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::PersistentVolumeSpec) }
          def inline_volume_spec; end

          T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
          def persistent_volume_name(val = nil); end
        end
      end
    end
  end
end