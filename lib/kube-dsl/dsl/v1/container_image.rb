# typed: strict

module KubeDSL
  module DSL
    module V1
      class ContainerImage < ::KubeDSL::DSLObject
        value_field :names
        value_field :size_bytes

        validates :names, field: { format: :string }, presence: false
        validates :size_bytes, field: { format: :integer }, presence: false

        def serialize
          {}.tap do |result|
            result[:names] = names
            result[:sizeBytes] = size_bytes
          end
        end

        def kind_sym
          :container_image
        end
      end
    end
  end
end