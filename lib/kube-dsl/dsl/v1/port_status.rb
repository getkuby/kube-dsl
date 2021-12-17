module KubeDSL::DSL::V1
  class PortStatus < ::KubeDSL::DSLObject
    value_field :error
    value_field :port
    value_field :protocol

    validates :error, field: { format: :string }, presence: false
    validates :port, field: { format: :integer }, presence: false
    validates :protocol, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:error] = error
        result[:port] = port
        result[:protocol] = protocol
      end
    end

    def kind_sym
      :port_status
    end
  end
end
