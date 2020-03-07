module KubeDSL::DSL::V1
  class EventSource < ::KubeDSL::DSLObject
    value_fields :component, :host

    def serialize
      {}.tap do |result|
        result[:component] = component
        result[:host] = host
      end
    end

    def kind_sym
      :event_source
    end
  end
end
