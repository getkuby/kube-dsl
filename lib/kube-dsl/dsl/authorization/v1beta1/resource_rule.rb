module KubeDSL::DSL::Authorization::V1beta1
  class ResourceRule < ::KubeDSL::DSLObject
    value_fields :api_groups, :resource_names, :resources, :verbs

    def serialize
      {}.tap do |result|
        result[:apiGroups] = api_groups
        result[:resourceNames] = resource_names
        result[:resources] = resources
        result[:verbs] = verbs
      end
    end

    def kind_sym
      :resource_rule
    end
  end
end
