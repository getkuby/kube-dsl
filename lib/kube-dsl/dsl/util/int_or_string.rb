module KubeDSL::DSL::Util
  class IntOrString
    extend ::KubeDSL::ValueFields


    def serialize
      {}.tap do |result|
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :int_or_string
    end
  end
end
