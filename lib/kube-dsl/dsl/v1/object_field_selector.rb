module KubeDSL::DSL::V1
  class ObjectFieldSelector
    extend ::KubeDSL::ValueFields

    value_fields :api_version, :field_path

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = api_version
        result[:fieldPath] = field_path
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :object_field_selector
    end
  end
end
