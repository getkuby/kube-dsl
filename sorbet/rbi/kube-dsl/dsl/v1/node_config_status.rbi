# typed: strict

module KubeDSL
  module DSL
    module V1
      class NodeConfigStatus < ::KubeDSL::DSLObject
        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::NodeConfigSource) }
        def active; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::NodeConfigSource) }
        def assigned; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def error(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::NodeConfigSource) }
        def last_known_good; end
      end
    end
  end
end