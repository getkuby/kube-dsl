module KubeDSL::DSL::Authorization::V1beta1
  class NonResourceAttributes < ::KubeDSL::DSLObject
    value_fields :path, :verb

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:verb] = verb
      end
    end

    def kind
      :non_resource_attributes
    end
  end
end
