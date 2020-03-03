module KubeDSL::DSL::V1
  class ResourceFieldSelector < ::KubeDSL::DSLObject
    value_fields :container_name, :divisor, :resource

    def serialize
      {}.tap do |result|
        result[:containerName] = container_name
        result[:divisor] = divisor
        result[:resource] = resource
      end
    end

    def kind
      :resource_field_selector
    end
  end
end
