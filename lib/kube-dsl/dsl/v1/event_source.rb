module KubeDSL::DSL::V1
  class EventSource
    extend ::KubeDSL::ValueFields

    value_fields :component, :host

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:component] = component
        result[:host] = host
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :event_source
    end
  end
end
