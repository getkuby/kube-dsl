module KubeDSL::DSL::V1
  class Capabilities < ::KubeDSL::DSLObject
    array_field :add
    array_field :drop

    def serialize
      {}.tap do |result|
        result[:add] = adds
        result[:drop] = drops
      end
    end

    def kind
      :capabilities
    end
  end
end
