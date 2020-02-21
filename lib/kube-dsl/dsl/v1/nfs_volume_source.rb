module KubeDSL::DSL::V1
  class NFSVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :path, :read_only, :server

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:readOnly] = read_only
        result[:server] = server
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :nfs_volume_source
    end
  end
end
