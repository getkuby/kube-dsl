module KubeDSL::DSL::V1
  class Sysctl < ::KubeDSL::DSLObject
    value_fields :name, :value

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:value] = value
      end
    end

    def kind
      :sysctl
    end
  end
end
