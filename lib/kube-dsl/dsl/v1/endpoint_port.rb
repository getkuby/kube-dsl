# typed: true

module KubeDSL::DSL::V1
  class EndpointPort < ::KubeDSL::DSLObject
    value_field :name
    value_field :port
    value_field :protocol

    validates :name, field: { format: :string }, presence: false
    validates :port, field: { format: :integer }, presence: false
    validates :protocol, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:port] = port
        result[:protocol] = protocol
      end
    end

    def kind_sym
      :endpoint_port
    end
  end
end
