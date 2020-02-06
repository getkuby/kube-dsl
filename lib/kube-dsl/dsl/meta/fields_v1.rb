module KubeDSL::DSL::Meta
  class FieldsV1
    extend ::KubeDSL::ValueFields


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
