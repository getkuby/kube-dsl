module KubeDSL::DSL::V1
  class NamespaceSpec < ::KubeDSL::DSLObject
    array_field :finalizer

    def serialize
      {}.tap do |result|
        result[:finalizers] = finalizers
      end
    end

    def kind
      :namespace_spec
    end
  end
end
