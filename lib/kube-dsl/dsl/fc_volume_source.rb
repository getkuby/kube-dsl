module KubeDSL::DSL
  class FCVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :fs_type, :lun, :read_only
    array_field :target_wwn
    array_field :wwid

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:lun] = lun
        result[:readOnly] = read_only
        result[:targetWWNs] = target_wwns
        result[:wwids] = wwids
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
