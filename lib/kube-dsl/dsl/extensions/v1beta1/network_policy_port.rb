# typed: true

module KubeDSL::DSL::Extensions::V1beta1
  class NetworkPolicyPort < ::KubeDSL::DSLObject
    value_field :port
    value_field :protocol

    validates :port, field: { format: :string }, presence: false
    validates :protocol, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:port] = port
        result[:protocol] = protocol
      end
    end

    def kind_sym
      :network_policy_port
    end
  end
end
