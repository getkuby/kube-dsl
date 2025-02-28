# typed: strict

module KubeDSL
  module DSL
    module V1
      class CSIPersistentVolumeSource < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::SecretReference).void)).returns(KubeDSL::DSL::V1::SecretReference) }
        def controller_expand_secret_ref(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def controller_expand_secret_ref_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::SecretReference).void)).returns(KubeDSL::DSL::V1::SecretReference) }
        def controller_publish_secret_ref(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def controller_publish_secret_ref_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def driver(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::SecretReference).void)).returns(KubeDSL::DSL::V1::SecretReference) }
        def node_publish_secret_ref(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def node_publish_secret_ref_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::SecretReference).void)).returns(KubeDSL::DSL::V1::SecretReference) }
        def node_stage_secret_ref(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def node_stage_secret_ref_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(::KubeDSL::KeyValueFields).void)).returns(::KubeDSL::KeyValueFields) }
        def volume_attributes(&block); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def volume_handle(val = nil); end
      end
    end
  end
end