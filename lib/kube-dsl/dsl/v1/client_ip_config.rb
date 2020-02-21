module KubeDSL::DSL::V1
  class ClientIPConfig
    extend ::KubeDSL::ValueFields

    value_fields :timeout_seconds

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:timeoutSeconds] = timeout_seconds
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :client_ip_config
    end
  end
end
