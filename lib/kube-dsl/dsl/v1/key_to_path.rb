# typed: strict

module KubeDSL
  module DSL
    module V1
      class KeyToPath < ::KubeDSL::DSLObject
        value_field :key
        value_field :mode
        value_field :path

        validates :key, field: { format: :string }, presence: false
        validates :mode, field: { format: :integer }, presence: false
        validates :path, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:key] = key
            result[:mode] = mode
            result[:path] = path
          end
        end

        def kind_sym
          :key_to_path
        end
      end
    end
  end
end