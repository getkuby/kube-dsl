# typed: true

module KubeDSL
  module DSL
    module V1
      class ConfigMapProjection < ::KubeDSL::DSLObject
        array_field(:item) { KubeDSL::DSL::V1::KeyToPath.new }
        value_field :name
        value_field :optional

        validates :items, array: { kind_of: KubeDSL::DSL::V1::KeyToPath }, presence: false
        validates :name, field: { format: :string }, presence: false
        validates :optional, field: { format: :boolean }, presence: false

        def serialize
          {}.tap do |result|
            result[:items] = items.map(&:serialize)
            result[:name] = name
            result[:optional] = optional
          end
        end

        def kind_sym
          :config_map_projection
        end
      end
    end
  end
end