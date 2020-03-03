module KubeDSL::DSL::V1
  class ResourceQuotaStatus < ::KubeDSL::DSLObject
    object_field(:hard) { ::KubeDSL::KeyValueFields.new(format: :string) }
    object_field(:used) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:hard] = hard.serialize
        result[:used] = used.serialize
      end
    end

    def kind
      :resource_quota_status
    end
  end
end
