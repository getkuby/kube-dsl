module KubeDSL::DSL::V1
  class HostPathVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :path, :type

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:type] = type
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :host_path_volume_source
    end
  end
end
