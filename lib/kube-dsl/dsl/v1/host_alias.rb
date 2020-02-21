module KubeDSL::DSL::V1
  class HostAlias
    extend ::KubeDSL::ValueFields

    value_fields :ip
    array_field :hostname

    def initialize(&block)
      instance_eval(&block) if block
    end

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
