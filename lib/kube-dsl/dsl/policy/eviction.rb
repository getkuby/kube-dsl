module KubeDSL::DSL::Policy
  class Eviction
    extend ::KubeDSL::ValueFields
    object_field(:delete_options) { KubeDSL::DSL::Meta::DeleteOptions.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "policy/v1beta1"
        result[:kind] = "Eviction"
        result[:deleteOptions] = delete_options.serialize
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
