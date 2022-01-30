# typed: strict

module KubeDSL::DSL::Storage::V1alpha1
  class VolumeAttachmentStatus < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig { returns(KubeDSL::DSL::Storage::V1alpha1::VolumeError) }
    def attach_error; end

    sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
    def attached(val = nil); end

    sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
    def attachment_metadata(&block); end

    sig { returns(KubeDSL::DSL::Storage::V1alpha1::VolumeError) }
    def detach_error; end

  end
end
