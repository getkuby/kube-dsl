# typed: true

module KubeDSL::DSL::V1
  class ResourceFieldSelector < ::KubeDSL::DSLObject
    value_field :container_name
    value_field :divisor
    value_field :resource

    validates :container_name, field: { format: :string }, presence: false
    validates :divisor, field: { format: :string }, presence: false
    validates :resource, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:containerName] = container_name
        result[:divisor] = divisor
        result[:resource] = resource
      end
    end

    def kind_sym
      :resource_field_selector
    end
  end
end
