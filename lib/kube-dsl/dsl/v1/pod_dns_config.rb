module KubeDSL::DSL::V1
  class PodDNSConfig < ::KubeDSL::DSLObject
    array_field :nameserver
    array_field(:option) { KubeDSL::DSL::V1::PodDNSConfigOption.new }
    array_field :search

    def serialize
      {}.tap do |result|
        result[:nameservers] = nameservers
        result[:options] = options.map(&:serialize)
        result[:searches] = searches
      end
    end

    def kind
      :pod_dns_config
    end
  end
end
