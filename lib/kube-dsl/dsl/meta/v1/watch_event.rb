module KubeDSL::DSL::Meta::V1
  class WatchEvent < ::KubeDSL::DSLObject
    value_fields :object, :type

    def serialize
      {}.tap do |result|
        result[:object] = object
        result[:type] = type
      end
    end

    def kind
      :watch_event
    end
  end
end
