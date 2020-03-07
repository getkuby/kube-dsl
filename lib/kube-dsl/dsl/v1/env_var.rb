module KubeDSL::DSL::V1
  class EnvVar < ::KubeDSL::DSLObject
    value_fields :name, :value
    object_field(:value_from) { KubeDSL::DSL::V1::EnvVarSource.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:value] = value
        result[:valueFrom] = value_from.serialize
      end
    end

    def kind_sym
      :env_var
    end
  end
end
