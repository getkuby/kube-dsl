module KubeDSL::DSL::V1
  class PodList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::Pod.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "PodList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :pod_list
    end
  end
end
