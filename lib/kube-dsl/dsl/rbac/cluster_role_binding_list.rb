module KubeDSL::DSL::Rbac
  class ClusterRoleBindingList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Rbac::ClusterRoleBinding.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1beta1"
        result[:kind] = "ClusterRoleBindingList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :cluster_role_binding_list
    end
  end
end
