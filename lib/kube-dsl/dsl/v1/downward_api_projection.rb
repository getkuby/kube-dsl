module KubeDSL::DSL::V1
  class DownwardAPIProjection
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::V1::DownwardAPIVolumeFile.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:items] = items.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :downward_api_projection
    end
  end
end
