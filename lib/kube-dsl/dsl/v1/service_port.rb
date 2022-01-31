# typed: true

module KubeDSL::DSL::V1
  class ServicePort < ::KubeDSL::DSLObject
    value_field :app_protocol
    value_field :name
    value_field :node_port
    value_field :port
    value_field :protocol
    value_field :target_port

    validates :app_protocol, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :node_port, field: { format: :integer }, presence: false
    validates :port, field: { format: :integer }, presence: false
    validates :protocol, field: { format: :string }, presence: false
    validates :target_port, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:appProtocol] = app_protocol
        result[:name] = name
        result[:nodePort] = node_port
        result[:port] = port
        result[:protocol] = protocol
        result[:targetPort] = target_port
      end
    end

    def kind_sym
      :service_port
    end
  end
end
