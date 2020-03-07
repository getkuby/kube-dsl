module KubeDSL::DSL::V1
  class DownwardAPIVolumeFile < ::KubeDSL::DSLObject
    value_fields :mode, :path
    object_field(:field_ref) { KubeDSL::DSL::V1::ObjectFieldSelector.new }
    object_field(:resource_field_ref) { KubeDSL::DSL::V1::ResourceFieldSelector.new }

    def serialize
      {}.tap do |result|
        result[:mode] = mode
        result[:path] = path
        result[:fieldRef] = field_ref.serialize
        result[:resourceFieldRef] = resource_field_ref.serialize
      end
    end

    def kind_sym
      :downward_api_volume_file
    end
  end
end
