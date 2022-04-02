# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1alpha1
        class VolumeAttachmentSpec < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def attacher(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def node_name(val = nil); end

          sig { returns(KubeDSL::DSL::Storage::V1alpha1::VolumeAttachmentSource) }
          def source; end
        end
      end
    end
  end
end