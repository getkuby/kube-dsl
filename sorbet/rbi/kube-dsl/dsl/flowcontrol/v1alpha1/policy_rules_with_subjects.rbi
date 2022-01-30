# typed: strict

module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PolicyRulesWithSubjects < ::KubeDSL::DSLObject
    sig {
      returns(
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      )
    }
    def serialize; end

    sig { returns(Symbol) }
    def kind_sym; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1alpha1::NonResourcePolicyRule))
      ).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1alpha1::NonResourcePolicyRule])
    }
    def non_resource_rules(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1alpha1::ResourcePolicyRule))
      ).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1alpha1::ResourcePolicyRule])
    }
    def resource_rules(elem_name = nil, &block); end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1alpha1::Subject))
      ).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1alpha1::Subject])
    }
    def subjects(elem_name = nil, &block); end

  end
end
