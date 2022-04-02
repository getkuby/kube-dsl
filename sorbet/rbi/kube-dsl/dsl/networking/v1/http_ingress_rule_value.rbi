# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class HTTPIngressRuleValue < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::HTTPIngressPath))
            ).returns(T::Array[KubeDSL::DSL::Networking::V1::HTTPIngressPath])
          }
          def paths(elem_name = nil, &block); end
        end
      end
    end
  end
end