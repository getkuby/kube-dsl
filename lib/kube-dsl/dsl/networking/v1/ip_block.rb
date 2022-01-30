# typed: true

module KubeDSL::DSL::Networking::V1
  class IPBlock < ::KubeDSL::DSLObject
    value_field :cidr
    value_field :except

    validates :cidr, field: { format: :string }, presence: false
    validates :except, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:cidr] = cidr
        result[:except] = except
      end
    end

    def kind_sym
      :ip_block
    end
  end
end
