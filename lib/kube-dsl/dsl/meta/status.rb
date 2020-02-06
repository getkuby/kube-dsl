module KubeDSL::DSL::Meta
  class Status
    extend ::KubeDSL::ValueFields

    value_fields :code, :message, :reason, :status
    object_field(:details) { KubeDSL::DSL::Meta::StatusDetails.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Status"
        result[:code] = code
        result[:message] = message
        result[:reason] = reason
        result[:status] = status
        result[:details] = details.serialize
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :status
    end
  end
end
