module KubeDSL::DSL
  class AzureFilePersistentVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :read_only, :secret_name, :secret_namespace, :share_name

    def serialize
      {}.tap do |result|
        result[:readOnly] = read_only
        result[:secretName] = secret_name
        result[:secretNamespace] = secret_namespace
        result[:shareName] = share_name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
