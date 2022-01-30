# typed: true

module KubeDSL::DSL::Extensions::V1beta1
  class HostPortRange < ::KubeDSL::DSLObject
    value_field :max
    value_field :min

    validates :max, field: { format: :integer }, presence: false
    validates :min, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:max] = max
        result[:min] = min
      end
    end

    def kind_sym
      :host_port_range
    end
  end
end
