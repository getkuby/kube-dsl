module KubeDSL::DSL
  class Namespace
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::NamespaceSpec.new }
    object_field(:status) { KubeDSL::DSL::NamespaceStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Namespace"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :namespace
    end
  end
end
