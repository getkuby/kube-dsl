module KubeDSL::DSL
  class DownwardAPIVolumeFile
    extend ::KubeDSL::ValueFields

    value_fields :mode, :path
    object_field(:field_ref) { KubeDSL::DSL::ObjectFieldSelector.new }
    object_field(:resource_field_ref) { KubeDSL::DSL::ResourceFieldSelector.new }

    def serialize
      {}.tap do |result|
        result[:mode] = mode
        result[:path] = path
        result[:fieldRef] = field_ref.serialize
        result[:resourceFieldRef] = resource_field_ref.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :downward_api_volume_file
    end
  end
end
