# typed: strict

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta1
        class FlowSchema < ::KubeDSL::DSLObject
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          object_field(:spec) { KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchemaSpec.new }
          object_field(:status) { KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchemaStatus.new }

          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :spec, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchemaSpec }
          validates :status, object: { kind_of: KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchemaStatus }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "flowcontrol.apiserver.k8s.io/v1beta1"
              result[:kind] = "FlowSchema"
              result[:metadata] = metadata.serialize
              result[:spec] = spec.serialize
              result[:status] = status.serialize
            end
          end

          def kind_sym
            :flow_schema
          end
        end
      end
    end
  end
end