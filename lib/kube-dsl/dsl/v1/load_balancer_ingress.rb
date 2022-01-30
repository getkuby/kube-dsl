# typed: true

module KubeDSL::DSL::V1
  class LoadBalancerIngress < ::KubeDSL::DSLObject
    value_field :hostname
    value_field :ip

    validates :hostname, field: { format: :string }, presence: false
    validates :ip, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:hostname] = hostname
        result[:ip] = ip
      end
    end

    def kind_sym
      :load_balancer_ingress
    end
  end
end
