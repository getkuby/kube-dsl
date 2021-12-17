module KubeDSL::DSL::Meta::V1
  class ManagedFieldsEntry < ::KubeDSL::DSLObject
    value_field :api_version
    value_field :fields_type
    value_field :fields_v1
    value_field :manager
    value_field :operation
    value_field :subresource
    value_field :time

    validates :api_version, field: { format: :string }, presence: false
    validates :fields_type, field: { format: :string }, presence: false
    validates :fields_v1, field: { format: :string }, presence: false
    validates :manager, field: { format: :string }, presence: false
    validates :operation, field: { format: :string }, presence: false
    validates :subresource, field: { format: :string }, presence: false
    validates :time, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:fieldsType] = fields_type
        result[:fieldsV1] = fields_v1
        result[:manager] = manager
        result[:operation] = operation
        result[:subresource] = subresource
        result[:time] = time
      end
    end

    def kind_sym
      :managed_fields_entry
    end
  end
end
