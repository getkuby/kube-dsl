module KubeDSL::DSL::Rbac::V1alpha1
  class RoleRef < ::KubeDSL::DSLObject
    value_fields :api_group, :kind, :name

    def serialize
      {}.tap do |result|
        result[:apiGroup] = api_group
        result[:kind] = kind
        result[:name] = name
      end
    end

    def kind
      :role_ref
    end
  end
end
