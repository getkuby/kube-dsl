module KubeDSL::DSL::V1
  class DownwardAPIProjection < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::DownwardAPIVolumeFile.new }

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
