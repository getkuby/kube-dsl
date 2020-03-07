module KubeDSL::DSL::V1
  class DownwardAPIVolumeSource < ::KubeDSL::DSLObject
    value_fields :default_mode
    array_field(:item) { KubeDSL::DSL::V1::DownwardAPIVolumeFile.new }

    def serialize
      {}.tap do |result|
        result[:defaultMode] = default_mode
        result[:items] = items.map(&:serialize)
      end
    end

    def kind_sym
      :downward_api_volume_source
    end
  end
end
