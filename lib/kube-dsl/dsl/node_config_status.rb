module KubeDSL::DSL
  class NodeConfigStatus
    extend ::KubeDSL::ValueFields
    value_fields :error
    object_field(:active) { KubeDSL::DSL::NodeConfigSource.new }
    object_field(:assigned) { KubeDSL::DSL::NodeConfigSource.new }
    object_field(:last_known_good) { KubeDSL::DSL::NodeConfigSource.new }

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
  end
end
