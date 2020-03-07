module KubeDSL::DSL::V1
  class ObjectFieldSelector < ::KubeDSL::DSLObject
    value_fields :api_version, :field_path

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:fieldPath] = field_path
      end
    end

    def kind_sym
      :object_field_selector
    end
  end
end
