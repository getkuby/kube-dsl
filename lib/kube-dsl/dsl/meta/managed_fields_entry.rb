module KubeDSL::DSL::Meta
  class ManagedFieldsEntry
    extend ::KubeDSL::ValueFields
    value_fields :api_version, :fields_type, :fields_v1, :manager, :operation, :time

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:fieldsType] = fields_type
        result[:fieldsV1] = fields_v1
        result[:manager] = manager
        result[:operation] = operation
        result[:time] = time
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
