# typed: true

module KubeDSL
  module DSL
    module V1
      class ReplicationController < ::KubeDSL::DSLObject
        object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
        object_field(:spec) { KubeDSL::DSL::V1::ReplicationControllerSpec.new }
        object_field(:status) { KubeDSL::DSL::V1::ReplicationControllerStatus.new }

        validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
        validates :spec, object: { kind_of: KubeDSL::DSL::V1::ReplicationControllerSpec }
        validates :status, object: { kind_of: KubeDSL::DSL::V1::ReplicationControllerStatus }

        def serialize
          {}.tap do |result|
            result[:apiVersion] = "v1"
            result[:kind] = "ReplicationController"
            result[:metadata] = metadata.serialize
            result[:spec] = spec.serialize
            result[:status] = status.serialize
          end
        end

        def kind_sym
          :replication_controller
        end
      end
    end
  end
end