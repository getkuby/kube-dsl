module KubeDSL::DSL::Extensions::V1beta1
  class RollbackConfig < ::KubeDSL::DSLObject
    value_fields :revision

    def serialize
      {}.tap do |result|
        result[:revision] = revision
      end
    end

    def kind
      :rollback_config
    end
  end
end
