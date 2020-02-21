module KubeDSL::DSL::V1
  class ResourceFieldSelector
    extend ::KubeDSL::ValueFields

    value_fields :container_name, :divisor, :resource

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :resource_field_selector
    end
  end
end
