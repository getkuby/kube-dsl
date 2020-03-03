module KubeDSL::DSL::Rbac::V1beta1
  class RoleBinding < ::KubeDSL::DSLObject
    array_field(:subject) { KubeDSL::DSL::Rbac::V1beta1::Subject.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:role_ref) { KubeDSL::DSL::Rbac::V1beta1::RoleRef.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1beta1"
        result[:kind] = "RoleBinding"
        result[:subjects] = subjects.map(&:serialize)
        result[:metadata] = metadata.serialize
        result[:roleRef] = role_ref.serialize
      end
    end

    def kind
      :role_binding
    end
  end
end
