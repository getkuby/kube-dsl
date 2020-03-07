module KubeDSL::DSL::V1
  class HostAlias < ::KubeDSL::DSLObject
    value_fields :ip
    array_field :hostname

    def serialize
      {}.tap do |result|
        result[:ip] = ip
        result[:hostnames] = hostnames
      end
    end

    def kind_sym
      :host_alias
    end
  end
end
