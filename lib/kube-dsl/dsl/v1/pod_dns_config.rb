module KubeDSL::DSL::V1
  class PodDNSConfig < ::KubeDSL::DSLObject
    value_fields :nameservers, :searches
    array_field(:option) { KubeDSL::DSL::V1::PodDNSConfigOption.new }

    def serialize
      {}.tap do |result|
        result[:nameservers] = nameservers
        result[:searches] = searches
        result[:options] = options.map(&:serialize)
      end
    end

    def kind_sym
      :pod_dns_config
    end
  end
end
