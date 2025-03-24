# typed: strict

module KubeDSL
  module DSL
    module V1
      class DownwardAPIVolumeFile < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ObjectFieldSelector).void)).returns(KubeDSL::DSL::V1::ObjectFieldSelector) }
        def field_ref(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def field_ref_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(T.nilable(Integer)) }
        def mode(val = nil); end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def path(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ResourceFieldSelector).void)).returns(KubeDSL::DSL::V1::ResourceFieldSelector) }
        def resource_field_ref(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def resource_field_ref_present?; end
      end
    end
  end
end