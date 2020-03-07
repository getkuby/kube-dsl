module KubeDSL::DSL::V1
  class VolumeDevice < ::KubeDSL::DSLObject
    value_fields :device_path, :name

    def serialize
      {}.tap do |result|
        result[:devicePath] = device_path
        result[:name] = name
      end
    end

    def kind_sym
      :volume_device
    end
  end
end
