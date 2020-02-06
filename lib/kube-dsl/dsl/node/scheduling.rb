module KubeDSL::DSL::Node
  class Scheduling
    extend ::KubeDSL::ValueFields

    array_field(:toleration) { KubeDSL::DSL::Toleration.new }
    object_field(:node_selector) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:tolerations] = tolerations.map(&:serialize)
        result[:nodeSelector] = node_selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :scheduling
    end
  end
end
