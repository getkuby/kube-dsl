module KubeDSL::DSL
  class GlusterfsPersistentVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :endpoints, :endpoints_namespace, :path, :read_only

    def serialize
      {}.tap do |result|
        result[:endpoints] = endpoints
        result[:endpointsNamespace] = endpoints_namespace
        result[:path] = path
        result[:readOnly] = read_only
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
