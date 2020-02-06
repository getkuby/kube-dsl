module KubeDSL::DSL
  class LoadBalancerIngress
    extend ::KubeDSL::ValueFields
    value_fields :hostname, :ip

    def serialize
      {}.tap do |result|
        result[:hostname] = hostname
        result[:ip] = ip
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
