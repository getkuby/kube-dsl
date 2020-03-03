module KubeDSL::DSL::Extensions::V1beta1
  class DaemonSetList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Extensions::V1beta1::DaemonSet.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
        result[:kind] = "DaemonSetList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :daemon_set_list
    end
  end
end
