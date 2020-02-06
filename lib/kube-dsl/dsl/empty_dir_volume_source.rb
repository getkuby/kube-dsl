module KubeDSL::DSL
  class EmptyDirVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :medium, :size_limit

    def serialize
      {}.tap do |result|
        result[:medium] = medium
        result[:sizeLimit] = size_limit
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
