module KubeDSL::DSL::Rbac::V1
  class RoleBindingList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Rbac::V1::RoleBinding.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1"
        result[:kind] = "RoleBindingList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :role_binding_list
    end
  end
end
