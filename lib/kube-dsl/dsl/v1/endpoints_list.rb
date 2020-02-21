module KubeDSL::DSL::V1
  class EndpointsList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::V1::Endpoints.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "EndpointsList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :endpoints_list
    end
  end
end
