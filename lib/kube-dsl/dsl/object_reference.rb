module KubeDSL::DSL
  class ObjectReference
    extend ::KubeDSL::ValueFields
    value_fields :api_version, :field_path, :kind, :name, :namespace, :resource_version, :uid

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:fieldPath] = field_path
        result[:kind] = kind
        result[:name] = name
        result[:namespace] = namespace
        result[:resourceVersion] = resource_version
        result[:uid] = uid
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
