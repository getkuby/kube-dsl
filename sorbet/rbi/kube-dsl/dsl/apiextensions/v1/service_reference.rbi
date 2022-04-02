# typed: strict

module KubeDSL
  module DSL
    module Apiextensions
      module V1
        class ServiceReference < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def path(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def port(val = nil); end
        end
      end
    end
  end
end