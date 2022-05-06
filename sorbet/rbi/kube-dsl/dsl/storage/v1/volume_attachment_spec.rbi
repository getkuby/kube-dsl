# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1
        class VolumeAttachmentSpec < ::KubeDSL::DSLObject
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

          T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::Storage::V1::VolumeAttachmentSource) }
          def source; end
        end
      end
    end
  end
end