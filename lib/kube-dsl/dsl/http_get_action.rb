module KubeDSL::DSL
  class HTTPGetAction
    extend ::KubeDSL::ValueFields
    value_fields :host, :path, :port, :scheme
    array_field(:http_header) { KubeDSL::DSL::HTTPHeader.new }

    def serialize
      {}.tap do |result|
        result[:host] = host
        result[:path] = path
        result[:port] = port
        result[:scheme] = scheme
        result[:httpHeaders] = http_headers.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
