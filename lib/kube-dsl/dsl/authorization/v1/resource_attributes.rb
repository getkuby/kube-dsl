module KubeDSL::DSL::Authorization::V1
  class ResourceAttributes < ::KubeDSL::DSLObject
    value_fields :group, :name, :namespace, :resource, :subresource, :verb, :version

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

    def kind_sym
      :resource_attributes
    end
  end
end
