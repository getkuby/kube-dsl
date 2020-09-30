module KubeDSL::DSL::Extensions::V1beta1
  class DaemonSetList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Extensions::V1beta1::DaemonSet.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Extensions::V1beta1::DaemonSet }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "DaemonSetList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :daemon_set_list
    end
  end
end
