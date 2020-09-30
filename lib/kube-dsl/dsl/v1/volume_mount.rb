module KubeDSL::DSL::V1
  class VolumeMount < ::KubeDSL::DSLObject
    value_field :mount_path
    value_field :mount_propagation
    value_field :name
    value_field :read_only
    value_field :sub_path
    value_field :sub_path_expr

    validates :mount_path, field: { format: :string }, presence: false
    validates :mount_propagation, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :read_only, field: { format: :boolean }, presence: false
    validates :sub_path, field: { format: :string }, presence: false
    validates :sub_path_expr, field: { format: :string }, presence: false

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

    def kind_sym
      :volume_mount
    end
  end
end
