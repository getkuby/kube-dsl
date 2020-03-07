module KubeDSL::DSL::V1
  class AzureFilePersistentVolumeSource < ::KubeDSL::DSLObject
    value_fields :read_only, :secret_name, :secret_namespace, :share_name

    def serialize
      {}.tap do |result|
        result[:readOnly] = read_only
        result[:secretName] = secret_name
        result[:secretNamespace] = secret_namespace
        result[:shareName] = share_name
      end
    end

    def kind_sym
      :azure_file_persistent_volume_source
    end
  end
end
