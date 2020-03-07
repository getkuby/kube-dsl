module KubeDSL::DSL::Rbac::V1alpha1
  class Role < ::KubeDSL::DSLObject
    array_field(:rule) { KubeDSL::DSL::Rbac::V1alpha1::PolicyRule.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1alpha1"
        result[:kind] = "Role"
        result[:rules] = rules.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :role
    end
  end
end
