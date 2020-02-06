module KubeDSL::DSL::Rbac
  class Role
    extend ::KubeDSL::ValueFields

    array_field(:rule) { KubeDSL::DSL::Rbac::PolicyRule.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1beta1"
        result[:kind] = "Role"
        result[:rules] = rules.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :role
    end
  end
end
