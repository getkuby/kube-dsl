module KubeDSL::DSL::V1
  class Binding < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:target) { KubeDSL::DSL::V1::ObjectReference.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Binding"
        result[:metadata] = metadata.serialize
        result[:target] = target.serialize
      end
    end

    def kind_sym
      :binding
    end
  end
end
