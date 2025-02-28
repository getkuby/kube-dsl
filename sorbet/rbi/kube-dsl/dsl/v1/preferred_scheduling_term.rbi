# typed: strict

module KubeDSL
  module DSL
    module V1
      class PreferredSchedulingTerm < ::KubeDSL::DSLObject
        extend KubeDSL::ValueFields::ClassMethods
        extend KubeDSL::Validations::ClassMethods
        include KubeDSL::ValueFields::InstanceMethods

        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::NodeSelectorTerm).void)).returns(KubeDSL::DSL::V1::NodeSelectorTerm) }
        def preference(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def preference_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(Integer)).returns(Integer) }
        def weight(val = nil); end
      end
    end
  end
end