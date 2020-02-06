module KubeDSL::DSL
  class HTTPHeader
    extend ::KubeDSL::ValueFields

    value_fields :name, :value

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:value] = value
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :http_header
    end
  end
end
