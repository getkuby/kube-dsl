module KubeDSL::DSL
  class CephFSVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :path, :read_only, :secret_file, :user
    array_field :monitor
    object_field(:secret_ref) { KubeDSL::DSL::LocalObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:readOnly] = read_only
        result[:secretFile] = secret_file
        result[:user] = user
        result[:monitors] = monitors
        result[:secretRef] = secret_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
