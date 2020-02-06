module KubeDSL::DSL
  class ResourceQuotaStatus
    extend ::KubeDSL::ValueFields
    object_field(:hard) { ::KubeDSL::KeyValueFields.new }
    object_field(:used) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:hard] = hard.serialize
        result[:used] = used.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
