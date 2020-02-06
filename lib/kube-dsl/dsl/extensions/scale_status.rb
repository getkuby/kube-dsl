module KubeDSL::DSL::Extensions
  class ScaleStatus
    extend ::KubeDSL::ValueFields
    value_fields :replicas, :target_selector
    object_field(:selector) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:replicas] = replicas
        result[:targetSelector] = target_selector
        result[:selector] = selector.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
