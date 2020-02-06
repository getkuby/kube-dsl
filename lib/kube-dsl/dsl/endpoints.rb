module KubeDSL::DSL
  class Endpoints
    extend ::KubeDSL::ValueFields
    array_field(:subset) { KubeDSL::DSL::EndpointSubset.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Endpoints"
        result[:subsets] = subsets.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
