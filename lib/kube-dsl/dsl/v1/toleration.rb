module KubeDSL::DSL::V1
  class Toleration < ::KubeDSL::DSLObject
    value_fields :effect, :key, :operator, :toleration_seconds, :value

    def serialize
      {}.tap do |result|
        result[:effect] = effect
        result[:key] = key
        result[:operator] = operator
        result[:tolerationSeconds] = toleration_seconds
        result[:value] = value
      end
    end

    def kind
      :toleration
    end
  end
end
