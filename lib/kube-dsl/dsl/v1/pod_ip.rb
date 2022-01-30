# typed: true

module KubeDSL::DSL::V1
  class PodIP < ::KubeDSL::DSLObject
    value_field :ip

    validates :ip, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:ip] = ip
      end
    end

    def kind_sym
      :pod_ip
    end
  end
end
