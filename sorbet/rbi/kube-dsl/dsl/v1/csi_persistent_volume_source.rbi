# typed: strict

module KubeDSL
  module DSL
    module V1
      class CSIPersistentVolumeSource < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def controller_expand_secret_ref; end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def controller_publish_secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def driver(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def node_publish_secret_ref; end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def node_stage_secret_ref; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def volume_attributes(&block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_handle(val = nil); end
      end
    end
  end
end