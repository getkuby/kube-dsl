module KubeDSL::DSL::V1
  class FCVolumeSource < ::KubeDSL::DSLObject
    value_fields :fs_type, :lun, :read_only, :target_ww_ns, :wwids

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:lun] = lun
        result[:readOnly] = read_only
        result[:targetWWNs] = target_ww_ns
        result[:wwids] = wwids
      end
    end

    def kind_sym
      :fc_volume_source
    end
  end
end
