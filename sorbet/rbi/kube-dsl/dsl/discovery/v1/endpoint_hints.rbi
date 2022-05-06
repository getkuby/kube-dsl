# typed: strict

module KubeDSL
  module DSL
    module Discovery
      module V1
        class EndpointHints < ::KubeDSL::DSLObject
          T::Sig::WithoutRuntime.sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          T::Sig::WithoutRuntime.sig { returns(Symbol) }
          def kind_sym; end

          T::Sig::WithoutRuntime.sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1::ForZone))
            ).returns(T::Array[KubeDSL::DSL::Discovery::V1::ForZone])
          }
          def for_zones(elem_name = nil, &block); end
        end
      end
    end
  end
end