module KubeDSL::DSL::Rbac::V1alpha1
  class RoleBinding < ::KubeDSL::DSLObject
    array_field(:subject) { KubeDSL::DSL::Rbac::V1alpha1::Subject.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:role_ref) { KubeDSL::DSL::Rbac::V1alpha1::RoleRef.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1alpha1"
        result[:kind] = "RoleBinding"
        result[:subjects] = subjects.map(&:serialize)
        result[:metadata] = metadata.serialize
        result[:roleRef] = role_ref.serialize
      end
    end

    def kind_sym
      :role_binding
    end
  end
end
