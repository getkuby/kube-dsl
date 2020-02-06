module KubeDSL::DSL
  class HostAlias
    extend ::KubeDSL::ValueFields

    value_fields :ip
    array_field :hostname

    def serialize
      {}.tap do |result|
        result[:ip] = ip
        result[:hostnames] = hostnames
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :host_alias
    end
  end
end
