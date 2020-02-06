module KubeDSL::DSL
  class PodDNSConfig
    extend ::KubeDSL::ValueFields

    array_field :nameserver
    array_field(:option) { KubeDSL::DSL::PodDNSConfigOption.new }
    array_field :search

    def serialize
      {}.tap do |result|
        result[:nameservers] = nameservers
        result[:options] = options.map(&:serialize)
        result[:searches] = searches
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :pod_dns_config
    end
  end
end
