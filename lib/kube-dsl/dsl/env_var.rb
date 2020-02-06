module KubeDSL::DSL
  class EnvVar
    extend ::KubeDSL::ValueFields

    value_fields :name, :value
    object_field(:value_from) { KubeDSL::DSL::EnvVarSource.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:value] = value
        result[:valueFrom] = value_from.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :env_var
    end
  end
end
