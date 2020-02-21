module KubeDSL::DSL::V1
  class LocalVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :fs_type, :path

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:path] = path
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :local_volume_source
    end
  end
end
