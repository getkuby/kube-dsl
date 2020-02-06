module KubeDSL::DSL
  class Quantity
    extend ::KubeDSL::ValueFields

    def serialize
      {}.tap do |result|
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
