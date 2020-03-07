module KubeDSL::DSL::V1
  class GlusterfsVolumeSource < ::KubeDSL::DSLObject
    value_fields :endpoints, :path, :read_only

    def serialize
      {}.tap do |result|
        result[:endpoints] = endpoints
        result[:path] = path
        result[:readOnly] = read_only
      end
    end

    def kind_sym
      :glusterfs_volume_source
    end
  end
end
