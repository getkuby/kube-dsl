module KubeDSL::DSL
  class Capabilities
    extend ::KubeDSL::ValueFields

    array_field :add
    array_field :drop

    def serialize
      {}.tap do |result|
        result[:add] = adds
        result[:drop] = drops
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :capabilities
    end
  end
end
