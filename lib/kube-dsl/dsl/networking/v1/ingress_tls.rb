module KubeDSL::DSL::Networking::V1
  class IngressTLS < ::KubeDSL::DSLObject
    value_field :hosts
    value_field :secret_name

    validates :hosts, field: { format: :string }, presence: false
    validates :secret_name, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:hosts] = hosts
        result[:secretName] = secret_name
      end
    end

    def kind_sym
      :ingress_tls
    end
  end
end
