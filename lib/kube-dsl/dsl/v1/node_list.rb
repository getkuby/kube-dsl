module KubeDSL::DSL::V1
  class NodeList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::Node.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::V1::Node }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "NodeList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :node_list
    end
  end
end
