module KubeDSL::DSL::V1
  class TypedLocalObjectReference
    extend ::KubeDSL::ValueFields

    value_fields :api_group, :kind, :name

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiGroup] = api_group
        result[:kind] = kind
        result[:name] = name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :typed_local_object_reference
    end
  end
end
