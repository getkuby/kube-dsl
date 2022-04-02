# typed: strict

module KubeDSL
  module DSL
    module V1
      class Probe < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::ExecAction) }
        def exec; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def failure_threshold(val = nil); end

        sig { returns(KubeDSL::DSL::V1::HTTPGetAction) }
        def http_get; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def initial_delay_seconds(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def period_seconds(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def success_threshold(val = nil); end

        sig { returns(KubeDSL::DSL::V1::TCPSocketAction) }
        def tcp_socket; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def termination_grace_period_seconds(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def timeout_seconds(val = nil); end
      end
    end
  end
end