module KubeDSL::DSL::V1
  class GlusterfsPersistentVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :endpoints, :endpoints_namespace, :path, :read_only

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :glusterfs_persistent_volume_source
    end
  end
end
