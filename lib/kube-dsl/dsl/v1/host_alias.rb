module KubeDSL::DSL::V1
  class HostAlias < ::KubeDSL::DSLObject
    value_fields :hostnames, :ip

    def serialize
      {}.tap do |result|
        result[:hostnames] = hostnames
        result[:ip] = ip
      end
    end

    def kind_sym
      :host_alias
    end
  end
end
