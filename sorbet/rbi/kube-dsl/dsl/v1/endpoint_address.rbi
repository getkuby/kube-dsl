# typed: strict

module KubeDSL
  module DSL
    module V1
      class EndpointAddress < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def hostname(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def ip(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def node_name(val = nil); end

        sig { returns(KubeDSL::DSL::V1::ObjectReference) }
        def target_ref; end
      end
    end
  end
end