module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequestStatus < ::KubeDSL::DSLObject
    value_fields :certificate
    array_field(:condition) { KubeDSL::DSL::Certificates::V1beta1::CertificateSigningRequestCondition.new }

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
