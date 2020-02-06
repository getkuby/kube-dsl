module KubeDSL::DSL
  class PodIP
    extend ::KubeDSL::ValueFields
    value_fields :ip

    def serialize
      {}.tap do |result|
        result[:ip] = ip
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
