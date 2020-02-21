module KubeDSL::DSL::Networking::V1
  class IPBlock
    extend ::KubeDSL::ValueFields

    value_fields :cidr
    array_field :except

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:cidr] = cidr
        result[:except] = excepts
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :ip_block
    end
  end
end
