module KubeDSL::DSL::V1
  class HTTPGetAction
    extend ::KubeDSL::ValueFields

    value_fields :host, :path, :port, :scheme
    array_field(:http_header) { KubeDSL::DSL::V1::HTTPHeader.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :http_get_action
    end
  end
end
