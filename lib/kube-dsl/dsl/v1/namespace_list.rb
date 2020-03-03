module KubeDSL::DSL::V1
  class NamespaceList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::Namespace.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "NamespaceList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :namespace_list
    end
  end
end
