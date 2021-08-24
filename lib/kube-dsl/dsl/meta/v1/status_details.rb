module KubeDSL::DSL::Meta::V1
  class StatusDetails < ::KubeDSL::DSLObject
    array_field(:cause) { KubeDSL::DSL::Meta::V1::StatusCause.new }
    value_field :group
    value_field :kind
    value_field :name
    value_field :retry_after_seconds
    value_field :uid

    validates :causes, array: { kind_of: KubeDSL::DSL::Meta::V1::StatusCause }, presence: false
    validates :group, field: { format: :string }, presence: false
    validates :kind, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :retry_after_seconds, field: { format: :integer }, presence: false
    validates :uid, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:causes] = causes.map(&:serialize)
        result[:group] = group
        result[:kind] = kind
        result[:name] = name
        result[:retryAfterSeconds] = retry_after_seconds
        result[:uid] = uid
      end
    end

    def kind_sym
      :status_details
    end
  end
end
