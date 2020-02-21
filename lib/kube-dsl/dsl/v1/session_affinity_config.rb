module KubeDSL::DSL::V1
  class SessionAffinityConfig
    extend ::KubeDSL::ValueFields

    object_field(:client_ip) { KubeDSL::DSL::V1::ClientIPConfig.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:clientIP] = client_ip.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :session_affinity_config
    end
  end
end
