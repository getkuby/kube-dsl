module KubeDSL::DSL::V1
  class GlusterfsPersistentVolumeSource < ::KubeDSL::DSLObject
    value_fields :endpoints, :endpoints_namespace, :path, :read_only

    def serialize
      {}.tap do |result|
        result[:endpoints] = endpoints
        result[:endpointsNamespace] = endpoints_namespace
        result[:path] = path
        result[:readOnly] = read_only
      end
    end

    def kind_sym
      :glusterfs_persistent_volume_source
    end
  end
end
