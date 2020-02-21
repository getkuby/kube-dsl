module KubeDSL::DSL::Admissionregistration::V1
  class RuleWithOperations
    extend ::KubeDSL::ValueFields

    value_fields :scope
    array_field :api_group
    array_field :api_version
    array_field :operation
    array_field :resource

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:scope] = scope
        result[:apiGroups] = api_groups
        result[:apiVersions] = api_versions
        result[:operations] = operations
        result[:resources] = resources
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :rule_with_operations
    end
  end
end
