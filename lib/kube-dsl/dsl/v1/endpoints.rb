module KubeDSL::DSL::V1
  class Endpoints < ::KubeDSL::DSLObject
    array_field(:subset) { KubeDSL::DSL::V1::EndpointSubset.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Endpoints"
        result[:subsets] = subsets.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :endpoints
    end
  end
end
