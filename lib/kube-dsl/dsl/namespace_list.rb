module KubeDSL::DSL
  class NamespaceList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Namespace.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "NamespaceList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :namespace_list
    end
  end
end
