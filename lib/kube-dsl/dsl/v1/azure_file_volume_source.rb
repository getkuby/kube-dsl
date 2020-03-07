module KubeDSL::DSL::V1
  class AzureFileVolumeSource < ::KubeDSL::DSLObject
    value_fields :read_only, :secret_name, :share_name

    def serialize
      {}.tap do |result|
        result[:readOnly] = read_only
        result[:secretName] = secret_name
        result[:shareName] = share_name
      end
    end

    def kind_sym
      :azure_file_volume_source
    end
  end
end
