module KubeDSL::DSL::V1
  class ReplicationControllerList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::ReplicationController.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::V1::ReplicationController }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "ReplicationControllerList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :replication_controller_list
    end
  end
end
