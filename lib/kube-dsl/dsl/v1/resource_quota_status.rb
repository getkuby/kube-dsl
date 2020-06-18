module KubeDSL::DSL::V1
  class ResourceQuotaStatus < ::KubeDSL::DSLObject
    key_value_field(:hard, format: :string)
    key_value_field(:used, format: :string)

    def serialize
      {}.tap do |result|
        result[:hard] = hard.serialize
        result[:used] = used.serialize
      end
    end

    def kind_sym
      :resource_quota_status
    end
  end
end
