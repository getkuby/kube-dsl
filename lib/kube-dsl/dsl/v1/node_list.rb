module KubeDSL::DSL::V1
  class NodeList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::Node.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "NodeList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :node_list
    end
  end
end
