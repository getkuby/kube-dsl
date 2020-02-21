module KubeDSL::DSL::Meta::V1
  class ManagedFieldsEntry
    extend ::KubeDSL::ValueFields

    value_fields :api_version, :fields_type, :fields_v1, :manager, :operation, :time

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :managed_fields_entry
    end
  end
end
