module KubeDSL::DSL
  class AzureFileVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :read_only, :secret_name, :share_name

    def serialize
      {}.tap do |result|
        result[:readOnly] = read_only
        result[:secretName] = secret_name
        result[:shareName] = share_name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :azure_file_volume_source
    end
  end
end
