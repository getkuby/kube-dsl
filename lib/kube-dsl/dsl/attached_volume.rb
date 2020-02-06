module KubeDSL::DSL
  class AttachedVolume
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

    def kind
      :attached_volume
    end
  end
end
