module KubeDSL::DSL::Authorization::V1beta1
  class ResourceRule < ::KubeDSL::DSLObject
    array_field :api_group
    array_field :resource_name
    array_field :resource
    array_field :verb

    def serialize
      {}.tap do |result|
        result[:apiGroups] = api_groups
        result[:resourceNames] = resource_names
        result[:resources] = resources
        result[:verbs] = verbs
      end
    end

    def kind
      :resource_rule
    end
  end
end
