module KubeDSL::DSL::V1
  class PodDNSConfigOption < ::KubeDSL::DSLObject
    value_fields :name, :value

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:value] = value
      end
    end

    def kind_sym
      :pod_dns_config_option
    end
  end
end
