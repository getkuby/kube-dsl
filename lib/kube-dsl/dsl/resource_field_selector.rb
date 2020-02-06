module KubeDSL::DSL
  class ResourceFieldSelector
    extend ::KubeDSL::ValueFields
    value_fields :container_name, :divisor, :resource

    def serialize
      {}.tap do |result|
        result[:containerName] = container_name
        result[:divisor] = divisor
        result[:resource] = resource
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
