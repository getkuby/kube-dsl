# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class LabelSelector < ::KubeDSL::DSLObject
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
              block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::LabelSelectorRequirement))
            ).returns(T::Array[KubeDSL::DSL::Meta::V1::LabelSelectorRequirement])
          }
          def match_expressions(elem_name = nil, &block); end

          T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def match_labels(&block); end
        end
      end
    end
  end
end