module KubeDSL::DSL::Meta::V1
  class APIResource < ::KubeDSL::DSLObject
    value_field :categories
    value_field :group
    value_field :kind
    value_field :name
    value_field :namespaced
    value_field :short_names
    value_field :singular_name
    value_field :storage_version_hash
    value_field :verbs
    value_field :version

    validates :categories, field: { format: :string }, presence: false
    validates :group, field: { format: :string }, presence: false
    validates :kind, field: { format: :string }, presence: false
    validates :name, field: { format: :string }, presence: false
    validates :namespaced, field: { format: :boolean }, presence: false
    validates :short_names, field: { format: :string }, presence: false
    validates :singular_name, field: { format: :string }, presence: false
    validates :storage_version_hash, field: { format: :string }, presence: false
    validates :verbs, field: { format: :string }, presence: false
    validates :version, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:categories] = categories
        result[:group] = group
        result[:kind] = kind
        result[:name] = name
        result[:namespaced] = namespaced
        result[:shortNames] = short_names
        result[:singularName] = singular_name
        result[:storageVersionHash] = storage_version_hash
        result[:verbs] = verbs
        result[:version] = version
      end
    end

    def kind_sym
      :api_resource
    end
  end
end
