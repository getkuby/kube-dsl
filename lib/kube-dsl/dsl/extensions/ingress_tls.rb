module KubeDSL::DSL::Extensions
  class IngressTLS
    extend ::KubeDSL::ValueFields
    value_fields :secret_name
    array_field :host

    def serialize
      {}.tap do |result|
        result[:secretName] = secret_name
        result[:hosts] = hosts
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
