module KubeDSL::DSL::V1
  class NamespaceSpec
    extend ::KubeDSL::ValueFields

    array_field :finalizer

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:finalizers] = finalizers
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :namespace_spec
    end
  end
end
