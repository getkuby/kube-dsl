module KubeDSL::DSL
  class DownwardAPIProjection
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::DownwardAPIVolumeFile.new }

    def serialize
      {}.tap do |result|
        result[:items] = items.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
