# typed: strict

module KubeDSL
  module DSL
    module V1
      class LoadBalancerIngress < ::KubeDSL::DSLObject
        value_field :hostname
        value_field :ip
        array_field(:port) { KubeDSL::DSL::V1::PortStatus.new }

        validates :hostname, field: { format: :string }, presence: false
        validates :ip, field: { format: :string }, presence: false
        validates :ports, array: { kind_of: KubeDSL::DSL::V1::PortStatus }, presence: false

        def serialize
          {}.tap do |result|
            result[:hostname] = hostname
            result[:ip] = ip
            result[:ports] = ports.map(&:serialize)
          end
        end

        def kind_sym
          :load_balancer_ingress
        end
      end
    end
  end
end