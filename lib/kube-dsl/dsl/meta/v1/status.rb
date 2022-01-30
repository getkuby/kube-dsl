# typed: true

module KubeDSL::DSL::Meta::V1
  class Status < ::KubeDSL::DSLObject
    value_field :code
    object_field(:details) { KubeDSL::DSL::Meta::V1::StatusDetails.new }
    value_field :message
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }
    value_field :reason
    value_field :status

    validates :code, field: { format: :integer }, presence: false
    validates :details, object: { kind_of: KubeDSL::DSL::Meta::V1::StatusDetails }
    validates :message, field: { format: :string }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }
    validates :reason, field: { format: :string }, presence: false
    validates :status, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:code] = code
        result[:details] = details.serialize
        result[:kind] = "Status"
        result[:message] = message
        result[:metadata] = metadata.serialize
        result[:reason] = reason
        result[:status] = status
      end
    end

    def kind_sym
      :status
    end
  end
end
