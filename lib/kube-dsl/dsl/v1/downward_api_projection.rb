# typed: true

module KubeDSL
  module DSL
    module V1
      class DownwardAPIProjection < ::KubeDSL::DSLObject
        array_field(:item) { KubeDSL::DSL::V1::DownwardAPIVolumeFile.new }

        validates :items, array: { kind_of: KubeDSL::DSL::V1::DownwardAPIVolumeFile }, presence: false

        def serialize
          {}.tap do |result|
            result[:items] = items.map(&:serialize)
          end
        end

        def kind_sym
          :downward_api_projection
        end
      end
    end
  end
end