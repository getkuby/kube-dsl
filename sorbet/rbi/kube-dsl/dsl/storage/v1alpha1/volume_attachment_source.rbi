# typed: strict

module KubeDSL::DSL::Storage::V1alpha1
  class VolumeAttachmentSource < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::V1::PersistentVolumeSpec) }
    def inline_volume_spec; end

    sig { params(val: T.nilable(String)).returns(String) }
    def persistent_volume_name(val = nil); end

  end
end
