# typed: strict

module KubeDSL
  module DSL
    module V1
      class ContainerPort < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def container_port(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def host_ip(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def host_port(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def protocol(val = nil); end
      end
    end
  end
end