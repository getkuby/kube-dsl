module KubeDSL::DSL::Meta::V1
  class APIResource < ::KubeDSL::DSLObject
    value_fields :group, :kind, :name, :namespaced, :singular_name, :storage_version_hash, :version
    array_field :category
    array_field :short_name
    array_field :verb

    def serialize
      {}.tap do |result|
        result[:group] = group
        result[:kind] = kind
        result[:name] = name
        result[:namespaced] = namespaced
        result[:singularName] = singular_name
        result[:storageVersionHash] = storage_version_hash
        result[:version] = version
        result[:categories] = categories
        result[:shortNames] = short_names
        result[:verbs] = verbs
      end
    end

    def kind
      :api_resource
    end
  end
end
