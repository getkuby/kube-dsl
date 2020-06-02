module KubeDSL::DSL::Meta::V1
  class APIResource < ::KubeDSL::DSLObject
    value_fields :categories, :group, :kind, :name, :namespaced, :short_names, :singular_name, :storage_version_hash, :verbs, :version

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
