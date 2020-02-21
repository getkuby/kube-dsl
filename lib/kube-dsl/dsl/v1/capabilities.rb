module KubeDSL::DSL::V1
  class Capabilities
    extend ::KubeDSL::ValueFields

    array_field :add
    array_field :drop

    def initialize(&block)
      instance_eval(&block) if block
    end

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
