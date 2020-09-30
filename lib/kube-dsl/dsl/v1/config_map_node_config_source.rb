module KubeDSL::DSL::V1
  class ConfigMapNodeConfigSource < ::KubeDSL::DSLObject
    value_field :kubelet_config_key
    value_field :name
    value_field :namespace
    value_field :resource_version
    value_field :uid

    validates :kubelet_config_key, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :namespace, field: { format: :string }, presence: false
    validates :resource_version, field: { format: :string }, presence: false
    validates :uid, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:kubeletConfigKey] = kubelet_config_key
        result[:name] = name
        result[:namespace] = namespace
        result[:resourceVersion] = resource_version
        result[:uid] = uid
      end
    end

    def kind_sym
      :config_map_node_config_source
    end
  end
end
