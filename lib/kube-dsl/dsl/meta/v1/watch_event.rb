module KubeDSL::DSL::Meta::V1
  class WatchEvent
    extend ::KubeDSL::ValueFields

    value_fields :object, :type

    def initialize(&block)
      instance_eval(&block) if block
    end

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
