module KubeDSL::DSL
  class NamespaceSpec
    extend ::KubeDSL::ValueFields
    array_field :finalizer

    def serialize
      {}.tap do |result|
        result[:finalizers] = finalizers
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
