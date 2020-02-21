module KubeDSL::DSL::Extensions::V1beta1
  class RollbackConfig
    extend ::KubeDSL::ValueFields

    value_fields :revision

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:revision] = revision
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :rollback_config
    end
  end
end
