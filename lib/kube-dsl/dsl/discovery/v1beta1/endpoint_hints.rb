module KubeDSL::DSL::Discovery::V1beta1
  class EndpointHints < ::KubeDSL::DSLObject
    array_field(:for_zone) { KubeDSL::DSL::Discovery::V1beta1::ForZone.new }

    validates :for_zones, array: { kind_of: KubeDSL::DSL::Discovery::V1beta1::ForZone }, presence: false

    def serialize
      {}.tap do |result|
        result[:forZones] = for_zones.map(&:serialize)
      end
    end

    def kind_sym
      :endpoint_hints
    end
  end
end
