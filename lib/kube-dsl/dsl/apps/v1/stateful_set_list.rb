module KubeDSL::DSL::Apps::V1
  class StatefulSetList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Apps::V1::StatefulSet.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1"
        result[:kind] = "StatefulSetList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :stateful_set_list
    end
  end
end
