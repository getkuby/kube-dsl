module KubeDSL::DSL::V1
  class NamespaceSpec < ::KubeDSL::DSLObject
    value_fields :finalizers

    def serialize
      {}.tap do |result|
        result[:finalizers] = finalizers
      end
    end

    def kind_sym
      :namespace_spec
    end
  end
end
