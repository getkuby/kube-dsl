# typed: true

module KubeDSL::DSL::Extensions::V1beta1
  class DeploymentStrategy < ::KubeDSL::DSLObject
    object_field(:rolling_update) { KubeDSL::DSL::Extensions::V1beta1::RollingUpdateDeployment.new }
    value_field :type

    validates :rolling_update, object: { kind_of: KubeDSL::DSL::Extensions::V1beta1::RollingUpdateDeployment }
    validates :type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:rollingUpdate] = rolling_update.serialize
        result[:type] = type
      end
    end

    def kind_sym
      :deployment_strategy
    end
  end
end
