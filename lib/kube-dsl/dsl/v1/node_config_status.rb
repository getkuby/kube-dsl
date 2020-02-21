module KubeDSL::DSL::V1
  class NodeConfigStatus
    extend ::KubeDSL::ValueFields

    value_fields :error
    object_field(:active) { KubeDSL::DSL::V1::NodeConfigSource.new }
    object_field(:assigned) { KubeDSL::DSL::V1::NodeConfigSource.new }
    object_field(:last_known_good) { KubeDSL::DSL::V1::NodeConfigSource.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:error] = error
        result[:active] = active.serialize
        result[:assigned] = assigned.serialize
        result[:lastKnownGood] = last_known_good.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :node_config_status
    end
  end
end
