module KubeDSL::DSL::Meta
  class WatchEvent
    extend ::KubeDSL::ValueFields

    value_fields :object, :type

    def serialize
      {}.tap do |result|
        result[:object] = object
        result[:type] = type
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :watch_event
    end
  end
end
