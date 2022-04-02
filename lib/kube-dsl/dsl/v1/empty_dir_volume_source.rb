# typed: true

module KubeDSL
  module DSL
    module V1
      class EmptyDirVolumeSource < ::KubeDSL::DSLObject
        value_field :medium
        value_field :size_limit

        validates :medium, field: { format: :string }, presence: false
        validates :size_limit, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:medium] = medium
            result[:sizeLimit] = size_limit
          end
        end

        def kind_sym
          :empty_dir_volume_source
        end
      end
    end
  end
end