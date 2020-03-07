module KubeDSL::DSL::V1
  class HTTPGetAction < ::KubeDSL::DSLObject
    value_fields :host, :path, :port, :scheme
    array_field(:http_header) { KubeDSL::DSL::V1::HTTPHeader.new }

    def serialize
      {}.tap do |result|
        result[:host] = host
        result[:path] = path
        result[:port] = port
        result[:scheme] = scheme
        result[:httpHeaders] = http_headers.map(&:serialize)
      end
    end

    def kind_sym
      :http_get_action
    end
  end
end
