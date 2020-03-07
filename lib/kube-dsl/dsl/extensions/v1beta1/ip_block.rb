module KubeDSL::DSL::Extensions::V1beta1
  class IPBlock < ::KubeDSL::DSLObject
    value_fields :cidr
    array_field :except

    def serialize
      {}.tap do |result|
        result[:cidr] = cidr
        result[:except] = excepts
      end
    end

    def kind_sym
      :ip_block
    end
  end
end
