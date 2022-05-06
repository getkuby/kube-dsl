# typed: strict

module KubeDSL
  module DSL
    module V1
      class ContainerPort < ::KubeDSL::DSLObject
        value_field :container_port
        value_field :host_ip
        value_field :host_port
        value_field :name
        value_field :protocol

        validates :container_port, field: { format: :integer }, presence: false
        validates :host_ip, field: { format: :string }, presence: false
        validates :host_port, field: { format: :integer }, presence: false
        validates :name, field: { format: :string }, presence: false
        validates :protocol, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:containerPort] = container_port
            result[:hostIP] = host_ip
            result[:hostPort] = host_port
            result[:name] = name
            result[:protocol] = protocol
          end
        end

        def kind_sym
          :container_port
        end
      end
    end
  end
end