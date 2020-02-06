module KubeDSL::DSL
  class NFSVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :path, :read_only, :server

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
  end
end
