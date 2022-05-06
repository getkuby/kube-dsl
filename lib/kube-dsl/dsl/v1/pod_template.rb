# typed: strict

module KubeDSL
  module DSL
    module V1
      class PodTemplate < ::KubeDSL::DSLObject
        object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
        object_field(:template) { KubeDSL::DSL::V1::PodTemplateSpec.new }

        validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
        validates :template, object: { kind_of: KubeDSL::DSL::V1::PodTemplateSpec }

        def serialize
          {}.tap do |result|
            result[:apiVersion] = "v1"
            result[:kind] = "PodTemplate"
            result[:metadata] = metadata.serialize
            result[:template] = template.serialize
          end
        end

        def kind_sym
          :pod_template
        end
      end
    end
  end
end