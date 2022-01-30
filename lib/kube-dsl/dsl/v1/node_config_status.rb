# typed: true

module KubeDSL::DSL::V1
  class NodeConfigStatus < ::KubeDSL::DSLObject
    object_field(:active) { KubeDSL::DSL::V1::NodeConfigSource.new }
    object_field(:assigned) { KubeDSL::DSL::V1::NodeConfigSource.new }
    value_field :error
    object_field(:last_known_good) { KubeDSL::DSL::V1::NodeConfigSource.new }

    validates :active, object: { kind_of: KubeDSL::DSL::V1::NodeConfigSource }
    validates :assigned, object: { kind_of: KubeDSL::DSL::V1::NodeConfigSource }
    validates :error, field: { format: :string }, presence: false
    validates :last_known_good, object: { kind_of: KubeDSL::DSL::V1::NodeConfigSource }

    def serialize
      {}.tap do |result|
        result[:active] = active.serialize
        result[:assigned] = assigned.serialize
        result[:error] = error
        result[:lastKnownGood] = last_known_good.serialize
      end
    end

    def kind_sym
      :node_config_status
    end
  end
end
