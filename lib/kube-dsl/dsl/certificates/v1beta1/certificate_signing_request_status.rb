module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequestStatus < ::KubeDSL::DSLObject
    value_field :certificate
    array_field(:condition) { KubeDSL::DSL::Certificates::V1beta1::CertificateSigningRequestCondition.new }

    validates :certificate, field: { format: :string }, presence: false
    validates :conditions, array: { kind_of: KubeDSL::DSL::Certificates::V1beta1::CertificateSigningRequestCondition }, presence: false

    def serialize
      {}.tap do |result|
        result[:certificate] = certificate
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def kind_sym
      :certificate_signing_request_status
    end
  end
end
