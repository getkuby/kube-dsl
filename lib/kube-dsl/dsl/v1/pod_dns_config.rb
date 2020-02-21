module KubeDSL::DSL::V1
  class PodDNSConfig
    extend ::KubeDSL::ValueFields

    array_field :nameserver
    array_field(:option) { KubeDSL::DSL::V1::PodDNSConfigOption.new }
    array_field :search

    def initialize(&block)
      instance_eval(&block) if block
    end

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
