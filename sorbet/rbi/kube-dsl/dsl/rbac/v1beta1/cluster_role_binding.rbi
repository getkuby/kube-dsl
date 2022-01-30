# typed: strict

module KubeDSL::DSL::Rbac::V1beta1
  class ClusterRoleBinding < ::KubeDSL::DSLObject
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

    sig { returns(KubeDSL::DSL::Rbac::V1beta1::RoleRef) }
    def role_ref; end

    sig {
      params(
        elem_name: T.nilable(Symbol),
        block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1beta1::Subject))
      ).returns(T::Array[KubeDSL::DSL::Rbac::V1beta1::Subject])
    }
    def subjects(elem_name = nil, &block); end

  end
end
