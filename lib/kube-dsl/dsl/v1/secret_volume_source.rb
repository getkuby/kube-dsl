module KubeDSL::DSL::V1
  class SecretVolumeSource < ::KubeDSL::DSLObject
    value_fields :default_mode, :optional, :secret_name
    array_field(:item) { KubeDSL::DSL::V1::KeyToPath.new }

    def serialize
      {}.tap do |result|
        result[:defaultMode] = default_mode
        result[:optional] = optional
        result[:secretName] = secret_name
        result[:items] = items.map(&:serialize)
      end
    end

    def kind_sym
      :secret_volume_source
    end
  end
end
