module KubeDSL::DSL::V1
  class LocalObjectReference < ::KubeDSL::DSLObject
    value_fields :name

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def kind_sym
      :local_object_reference
    end
  end
end
