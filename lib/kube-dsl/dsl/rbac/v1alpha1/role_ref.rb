module KubeDSL::DSL::Rbac::V1alpha1
  class RoleRef
    extend ::KubeDSL::ValueFields

    value_fields :api_group, :kind, :name

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiGroup] = api_group
        result[:kind] = kind
        result[:name] = name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :role_ref
    end
  end
end
