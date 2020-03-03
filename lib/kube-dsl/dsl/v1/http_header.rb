module KubeDSL::DSL::V1
  class HTTPHeader < ::KubeDSL::DSLObject
    value_fields :name, :value

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:value] = value
      end
    end

    def kind
      :http_header
    end
  end
end
