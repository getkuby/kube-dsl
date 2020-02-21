module KubeDSL::DSL::Meta::V1
  class Patch
    extend ::KubeDSL::ValueFields


    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :patch
    end
  end
end
