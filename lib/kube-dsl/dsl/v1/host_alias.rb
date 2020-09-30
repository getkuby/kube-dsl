module KubeDSL::DSL::V1
  class HostAlias < ::KubeDSL::DSLObject
    value_field :hostnames
    value_field :ip

    validates :hostnames, field: { format: :string }, presence: false
    validates :ip, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:hostnames] = hostnames
        result[:ip] = ip
      end
    end

    def kind_sym
      :host_alias
    end
  end
end
