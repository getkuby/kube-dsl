module KubeDSL::DSL::Meta
  class MicroTime
    extend ::KubeDSL::ValueFields


    def serialize
      {}.tap do |result|
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :micro_time
    end
  end
end
