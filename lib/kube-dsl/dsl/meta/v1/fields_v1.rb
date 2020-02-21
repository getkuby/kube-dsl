module KubeDSL::DSL::Meta::V1
  class FieldsV1
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
      :fields_v1
    end
  end
end
