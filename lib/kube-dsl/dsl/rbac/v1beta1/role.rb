# typed: true

module KubeDSL::DSL::Rbac::V1beta1
  class Role < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    array_field(:rule) { KubeDSL::DSL::Rbac::V1beta1::PolicyRule.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :rules, array: { kind_of: KubeDSL::DSL::Rbac::V1beta1::PolicyRule }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "rbac.authorization.k8s.io/v1beta1"
        result[:kind] = "Role"
        result[:metadata] = metadata.serialize
        result[:rules] = rules.map(&:serialize)
      end
    end

    def kind_sym
      :role
    end
  end
end
