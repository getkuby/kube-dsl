module KubeDSL::DSL::V1
  class NFSVolumeSource < ::KubeDSL::DSLObject
    value_fields :path, :read_only, :server

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:readOnly] = read_only
        result[:server] = server
      end
    end

    def kind_sym
      :nfs_volume_source
    end
  end
end
