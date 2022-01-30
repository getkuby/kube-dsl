# typed: true

module KubeDSL::DSL::V1
  class ConfigMapKeySelector < ::KubeDSL::DSLObject
    value_field :key
    value_field :name
    value_field :optional

    validates :key, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :optional, field: { format: :boolean }, presence: false

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:name] = name
        result[:optional] = optional
      end
    end

    def kind_sym
      :config_map_key_selector
    end
  end
end
