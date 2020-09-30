module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequestCondition < ::KubeDSL::DSLObject
    value_field :last_update_time
    value_field :message
    value_field :reason
    value_field :type

    validates :last_update_time, field: { format: :string }, presence: false
    validates :message, field: { format: :string }, presence: false
    validates :reason, field: { format: :string }, presence: false
    validates :type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:lastUpdateTime] = last_update_time
        result[:message] = message
        result[:reason] = reason
        result[:type] = type
      end
    end

    def kind_sym
      :certificate_signing_request_condition
    end
  end
end
