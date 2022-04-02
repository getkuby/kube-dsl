# typed: strict

module KubeDSL
  module DSL
    module V1
      class PersistentVolumeClaimStatus < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def access_modes(val = nil); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def capacity(&block); end

        sig {
          params(
            elem_name: T.nilable(Symbol),
            block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PersistentVolumeClaimCondition))
          ).returns(T::Array[KubeDSL::DSL::V1::PersistentVolumeClaimCondition])
        }
        def conditions(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def phase(val = nil); end
      end
    end
  end
end