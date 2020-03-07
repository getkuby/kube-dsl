module KubeDSL::DSL::Apps::V1beta1
  class RollbackConfig < ::KubeDSL::DSLObject
    value_fields :revision

    def serialize
      {}.tap do |result|
        result[:revision] = revision
      end
    end

    def kind_sym
      :rollback_config
    end
  end
end
