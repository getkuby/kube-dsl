module KubeDSL::DSL
  class EventSource
    extend ::KubeDSL::ValueFields
    value_fields :component, :host

    def serialize
      {}.tap do |result|
        result[:component] = component
        result[:host] = host
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
