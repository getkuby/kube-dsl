module KubeDSL::DSL::V1
  class HostPathVolumeSource < ::KubeDSL::DSLObject
    value_fields :path, :type

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:type] = type
      end
    end

    def kind_sym
      :host_path_volume_source
    end
  end
end
