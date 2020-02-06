module KubeDSL::DSL::Rbac
  class RoleBinding
    extend ::KubeDSL::ValueFields
    array_field(:subject) { KubeDSL::DSL::Rbac::Subject.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:role_ref) { KubeDSL::DSL::Rbac::RoleRef.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1beta1"
        result[:kind] = "RoleBinding"
        result[:subjects] = subjects.map(&:serialize)
        result[:metadata] = metadata.serialize
        result[:roleRef] = role_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
