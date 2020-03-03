module KubeDSL::DSL::Policy::V1beta1
  class Eviction < ::KubeDSL::DSLObject
    object_field(:delete_options) { KubeDSL::DSL::Meta::V1::DeleteOptions.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "policy/v1beta1"
        result[:kind] = "Eviction"
        result[:deleteOptions] = delete_options.serialize
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :eviction
    end
  end
end
