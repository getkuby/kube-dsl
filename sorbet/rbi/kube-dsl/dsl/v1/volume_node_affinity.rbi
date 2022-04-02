# typed: strict

module KubeDSL
  module DSL
    module V1
      class VolumeNodeAffinity < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::NodeSelector) }
        def required; end
      end
    end
  end
end