module KubeDSL::DSL::Extensions::V1beta1
  class RollbackConfig < ::KubeDSL::DSLObject
    value_field :revision

    validates :revision, field: { format: :integer }, presence: false

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
