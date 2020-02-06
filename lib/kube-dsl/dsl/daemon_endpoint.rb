module KubeDSL::DSL
  class DaemonEndpoint
    extend ::KubeDSL::ValueFields
    value_fields :port

    def serialize
      {}.tap do |result|
        result[:Port] = port
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
