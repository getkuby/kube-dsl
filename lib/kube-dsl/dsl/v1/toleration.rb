module KubeDSL::DSL::V1
  class Toleration
    extend ::KubeDSL::ValueFields

    value_fields :effect, :key, :operator, :toleration_seconds, :value

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:effect] = effect
        result[:key] = key
        result[:operator] = operator
        result[:tolerationSeconds] = toleration_seconds
        result[:value] = value
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :toleration
    end
  end
end
