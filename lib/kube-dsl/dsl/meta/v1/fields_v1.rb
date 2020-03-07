module KubeDSL::DSL::Meta::V1
  class FieldsV1 < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind_sym
      :fields_v1
    end
  end
end
