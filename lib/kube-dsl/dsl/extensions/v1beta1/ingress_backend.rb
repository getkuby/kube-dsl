module KubeDSL::DSL::Extensions::V1beta1
  class IngressBackend < ::KubeDSL::DSLObject
    value_field :service_name
    value_field :service_port

    validates :service_name, field: { format: :string }, presence: false
    validates :service_port, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:serviceName] = service_name
        result[:servicePort] = service_port
      end
    end

    def kind_sym
      :ingress_backend
    end
  end
end
