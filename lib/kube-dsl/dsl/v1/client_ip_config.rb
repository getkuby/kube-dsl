module KubeDSL::DSL::V1
  class ClientIPConfig < ::KubeDSL::DSLObject
    value_field :timeout_seconds

    validates :timeout_seconds, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:timeoutSeconds] = timeout_seconds
      end
    end

    def kind_sym
      :client_ip_config
    end
  end
end
