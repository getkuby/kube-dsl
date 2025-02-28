# typed: strict

module KubeDSL
  module DSL
    module V1
      class ResourceQuota < ::KubeDSL::DSLObject
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



        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::Meta::V1::ObjectMeta).void)).returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def metadata_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ResourceQuotaSpec).void)).returns(KubeDSL::DSL::V1::ResourceQuotaSpec) }
        def spec(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def spec_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ResourceQuotaStatus).void)).returns(KubeDSL::DSL::V1::ResourceQuotaStatus) }
        def status(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def status_present?; end
      end
    end
  end
end