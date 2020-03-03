module KubeDSL::DSL::V1
  class VolumeMount < ::KubeDSL::DSLObject
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

    def kind
      :volume_mount
    end
  end
end
