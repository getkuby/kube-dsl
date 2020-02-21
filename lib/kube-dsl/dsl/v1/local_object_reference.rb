module KubeDSL::DSL::V1
  class LocalObjectReference
    extend ::KubeDSL::ValueFields

    value_fields :name

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :local_object_reference
    end
  end
end
