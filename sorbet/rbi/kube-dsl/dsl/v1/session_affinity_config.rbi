# typed: strict

module KubeDSL
  module DSL
    module V1
      class SessionAffinityConfig < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ClientIPConfig).void)).returns(KubeDSL::DSL::V1::ClientIPConfig) }
        def client_ip(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def client_ip_present?; end
      end
    end
  end
end