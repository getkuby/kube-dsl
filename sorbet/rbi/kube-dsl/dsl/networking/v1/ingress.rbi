# typed: strict

module KubeDSL
  module DSL
    module Networking
      module V1
        class Ingress < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end



          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Networking::V1::IngressSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Networking::V1::IngressStatus) }
          def status; end
        end
      end
    end
  end
end