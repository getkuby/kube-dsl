module KubeDSL::DSL::V1
  class Namespace < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::V1::NamespaceSpec.new }
    object_field(:status) { KubeDSL::DSL::V1::NamespaceStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Namespace"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind
      :namespace
    end
  end
end
