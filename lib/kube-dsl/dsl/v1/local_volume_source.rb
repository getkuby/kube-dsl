module KubeDSL::DSL::V1
  class LocalVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :path

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:path] = path
      end
    end

    def kind_sym
      :local_volume_source
    end
  end
end
