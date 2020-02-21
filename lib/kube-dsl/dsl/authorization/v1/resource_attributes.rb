module KubeDSL::DSL::Authorization::V1
  class ResourceAttributes
    extend ::KubeDSL::ValueFields

    value_fields :group, :name, :namespace, :resource, :subresource, :verb, :version

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:group] = group
        result[:name] = name
        result[:namespace] = namespace
        result[:resource] = resource
        result[:subresource] = subresource
        result[:verb] = verb
        result[:version] = version
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :resource_attributes
    end
  end
end
