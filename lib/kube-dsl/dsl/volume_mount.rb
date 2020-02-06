module KubeDSL::DSL
  class VolumeMount
    extend ::KubeDSL::ValueFields
    value_fields :mount_path, :mount_propagation, :name, :read_only, :sub_path, :sub_path_expr

    def serialize
      {}.tap do |result|
        result[:mountPath] = mount_path
        result[:mountPropagation] = mount_propagation
        result[:name] = name
        result[:readOnly] = read_only
        result[:subPath] = sub_path
        result[:subPathExpr] = sub_path_expr
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
