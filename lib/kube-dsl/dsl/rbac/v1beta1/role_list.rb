module KubeDSL::DSL::Rbac::V1beta1
  class RoleList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Rbac::V1beta1::Role.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1beta1"
        result[:kind] = "RoleList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :role_list
    end
  end
end
