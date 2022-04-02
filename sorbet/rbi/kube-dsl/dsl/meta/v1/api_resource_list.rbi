# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class APIResourceList < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end


          sig { params(val: T.nilable(String)).returns(String) }
          def group_version(val = nil); end


          sig {
            params(
              elem_name: T.nilable(Symbol),
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::APIResource))
            ).returns(T::Array[KubeDSL::DSL::Meta::V1::APIResource])
          }
          def resources(elem_name = nil, &block); end
        end
      end
    end
  end
end