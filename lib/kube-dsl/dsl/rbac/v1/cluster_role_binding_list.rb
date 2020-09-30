module KubeDSL::DSL::Rbac::V1
  class ClusterRoleBindingList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Rbac::V1::ClusterRoleBinding.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Rbac::V1::ClusterRoleBinding }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "ClusterRoleBindingList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :cluster_role_binding_list
    end
  end
end
