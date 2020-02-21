module KubeDSL::DSL::V1
  class DaemonEndpoint
    extend ::KubeDSL::ValueFields

    value_fields :port

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:Port] = port
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :daemon_endpoint
    end
  end
end
