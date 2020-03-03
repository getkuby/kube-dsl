module KubeDSL::DSL::Rbac::V1alpha1
  class ClusterRoleBindingList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Rbac::V1alpha1::ClusterRoleBinding.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1alpha1"
        result[:kind] = "ClusterRoleBindingList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :cluster_role_binding_list
    end
  end
end
