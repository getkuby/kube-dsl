module KubeDSL::DSL
  class HostPathVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :path, :type

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:type] = type
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
