module KubeDSL::DSL::V1
  class PodDNSConfig < ::KubeDSL::DSLObject
    value_field :nameservers
    array_field(:option) { KubeDSL::DSL::V1::PodDNSConfigOption.new }
    value_field :searches

    validates :nameservers, field: { format: :string }, presence: false
    validates :options, array: { kind_of: KubeDSL::DSL::V1::PodDNSConfigOption }, presence: false
    validates :searches, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:nameservers] = nameservers
        result[:options] = options.map(&:serialize)
        result[:searches] = searches
      end
    end

    def kind_sym
      :pod_dns_config
    end
  end
end
