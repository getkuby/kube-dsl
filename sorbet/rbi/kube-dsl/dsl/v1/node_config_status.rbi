# typed: strict

module KubeDSL
  module DSL
    module V1
      class NodeConfigStatus < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::NodeConfigSource).void)).returns(KubeDSL::DSL::V1::NodeConfigSource) }
        def active(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def active_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::NodeConfigSource).void)).returns(KubeDSL::DSL::V1::NodeConfigSource) }
        def assigned(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def assigned_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def error(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::NodeConfigSource).void)).returns(KubeDSL::DSL::V1::NodeConfigSource) }
        def last_known_good(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def last_known_good_present?; end
      end
    end
  end
end