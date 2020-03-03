module KubeDSL::DSL::V1
  class ReplicationController < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::V1::ReplicationControllerSpec.new }
    object_field(:status) { KubeDSL::DSL::V1::ReplicationControllerStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ReplicationController"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind
      :replication_controller
    end
  end
end
