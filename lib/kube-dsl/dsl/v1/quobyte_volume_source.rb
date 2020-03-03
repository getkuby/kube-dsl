module KubeDSL::DSL::V1
  class QuobyteVolumeSource < ::KubeDSL::DSLObject
    value_fields :group, :read_only, :registry, :tenant, :user, :volume

    def serialize
      {}.tap do |result|
        result[:group] = group
        result[:readOnly] = read_only
        result[:registry] = registry
        result[:tenant] = tenant
        result[:user] = user
        result[:volume] = volume
      end
    end

    def kind
      :quobyte_volume_source
    end
  end
end
