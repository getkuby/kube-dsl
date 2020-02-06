module KubeDSL::DSL
  class VolumeDevice
    extend ::KubeDSL::ValueFields
    value_fields :device_path, :name

    def serialize
      {}.tap do |result|
        result[:devicePath] = device_path
        result[:name] = name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
