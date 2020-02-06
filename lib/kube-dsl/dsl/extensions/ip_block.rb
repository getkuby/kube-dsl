module KubeDSL::DSL::Extensions
  class IPBlock
    extend ::KubeDSL::ValueFields
    value_fields :cidr
    array_field :except

    def serialize
      {}.tap do |result|
        result[:cidr] = cidr
        result[:except] = excepts
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
