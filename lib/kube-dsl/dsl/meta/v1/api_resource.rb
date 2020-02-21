module KubeDSL::DSL::Meta::V1
  class APIResource
    extend ::KubeDSL::ValueFields

    value_fields :group, :kind, :name, :namespaced, :singular_name, :storage_version_hash, :version
    array_field :category
    array_field :short_name
    array_field :verb

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :api_resource
    end
  end
end
