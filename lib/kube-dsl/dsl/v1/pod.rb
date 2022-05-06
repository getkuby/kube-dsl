# typed: strict

module KubeDSL
  module DSL
    module V1
      class Pod < ::KubeDSL::DSLObject
        object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
        object_field(:spec) { KubeDSL::DSL::V1::PodSpec.new }
        object_field(:status) { KubeDSL::DSL::V1::PodStatus.new }

        validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
        validates :spec, object: { kind_of: KubeDSL::DSL::V1::PodSpec }
        validates :status, object: { kind_of: KubeDSL::DSL::V1::PodStatus }

        def serialize
          {}.tap do |result|
            result[:apiVersion] = "v1"
            result[:kind] = "Pod"
            result[:metadata] = metadata.serialize
            result[:spec] = spec.serialize
            result[:status] = status.serialize
          end
        end

        def kind_sym
          :pod
        end
      end
    end
  end
end