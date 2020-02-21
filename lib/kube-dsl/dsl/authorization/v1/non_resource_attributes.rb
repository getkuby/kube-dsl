module KubeDSL::DSL::Authorization::V1
  class NonResourceAttributes
    extend ::KubeDSL::ValueFields

    value_fields :path, :verb

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:verb] = verb
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :non_resource_attributes
    end
  end
end
