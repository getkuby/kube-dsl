module KubeDSL::DSL::Meta::V1
  class Status < ::KubeDSL::DSLObject
    value_fields :code, :message, :reason, :status
    object_field(:details) { KubeDSL::DSL::Meta::V1::StatusDetails.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

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

    def kind_sym
      :status
    end
  end
end
