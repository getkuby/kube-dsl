module KubeDSL::DSL::V1
  class HTTPHeader
    extend ::KubeDSL::ValueFields

    value_fields :name, :value

    def initialize(&block)
      instance_eval(&block) if block
    end

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
