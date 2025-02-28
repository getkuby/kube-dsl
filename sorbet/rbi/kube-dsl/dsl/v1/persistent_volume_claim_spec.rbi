# typed: strict

module KubeDSL
  module DSL
    module V1
      class PersistentVolumeClaimSpec < ::KubeDSL::DSLObject
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
        def access_modes(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::TypedLocalObjectReference).void)).returns(KubeDSL::DSL::V1::TypedLocalObjectReference) }
        def data_source(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def data_source_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::TypedLocalObjectReference).void)).returns(KubeDSL::DSL::V1::TypedLocalObjectReference) }
        def data_source_ref(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def data_source_ref_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ResourceRequirements).void)).returns(KubeDSL::DSL::V1::ResourceRequirements) }
        def resources(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def resources_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Meta::V1::LabelSelector).void)).returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
        def selector(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def selector_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def storage_class_name(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def volume_mode(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def volume_name(val = nil); end
      end
    end
  end
end