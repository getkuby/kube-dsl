# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class CustomResourceConversion < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def strategy(val = nil); end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::WebhookConversion) }
          def webhook; end
        end
      end
    end
  end
end