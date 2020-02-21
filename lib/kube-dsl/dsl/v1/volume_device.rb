module KubeDSL::DSL::V1
  class VolumeDevice
    extend ::KubeDSL::ValueFields

    value_fields :device_path, :name

    def initialize(&block)
      instance_eval(&block) if block
    end

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
      :volume_device
    end
  end
end
