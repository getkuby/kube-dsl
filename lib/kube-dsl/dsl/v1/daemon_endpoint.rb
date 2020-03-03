module KubeDSL::DSL::V1
  class DaemonEndpoint < ::KubeDSL::DSLObject
    value_fields :port

    def serialize
      {}.tap do |result|
        result[:Port] = port
      end
    end

    def kind
      :daemon_endpoint
    end
  end
end
