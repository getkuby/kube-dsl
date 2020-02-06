module KubeDSL::DSL
  class Binding
    extend ::KubeDSL::ValueFields
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:target) { KubeDSL::DSL::ObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Binding"
        result[:metadata] = metadata.serialize
        result[:target] = target.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
