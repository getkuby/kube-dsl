# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class Status < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end


          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def code(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::StatusDetails) }
          def details; end


          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end
        end
      end
    end
  end
end