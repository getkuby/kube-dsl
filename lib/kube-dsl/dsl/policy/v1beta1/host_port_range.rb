module KubeDSL::DSL::Policy::V1beta1
  class HostPortRange < ::KubeDSL::DSLObject
    value_fields :max, :min

    def serialize
      {}.tap do |result|
        result[:max] = max
        result[:min] = min
      end
    end

    def kind
      :host_port_range
    end
  end
end
