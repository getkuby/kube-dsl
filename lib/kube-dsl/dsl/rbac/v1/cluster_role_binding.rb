module KubeDSL::DSL::Rbac::V1
  class ClusterRoleBinding < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:role_ref) { KubeDSL::DSL::Rbac::V1::RoleRef.new }
    array_field(:subject) { KubeDSL::DSL::Rbac::V1::Subject.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :role_ref, object: { kind_of: KubeDSL::DSL::Rbac::V1::RoleRef }
    validates :subjects, array: { kind_of: KubeDSL::DSL::Rbac::V1::Subject }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1"
        result[:kind] = "ClusterRoleBinding"
        result[:metadata] = metadata.serialize
        result[:roleRef] = role_ref.serialize
        result[:subjects] = subjects.map(&:serialize)
      end
    end

    def kind_sym
      :cluster_role_binding
    end
  end
end
