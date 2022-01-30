# typed: true

module KubeDSL::DSL::V1
  class Endpoints < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    array_field(:subset) { KubeDSL::DSL::V1::EndpointSubset.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :subsets, array: { kind_of: KubeDSL::DSL::V1::EndpointSubset }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Endpoints"
        result[:metadata] = metadata.serialize
        result[:subsets] = subsets.map(&:serialize)
      end
    end

    def kind_sym
      :endpoints
    end
  end
end
