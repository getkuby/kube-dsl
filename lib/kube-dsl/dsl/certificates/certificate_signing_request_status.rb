module KubeDSL::DSL::Certificates
  class CertificateSigningRequestStatus
    extend ::KubeDSL::ValueFields

    value_fields :certificate
    array_field(:condition) { KubeDSL::DSL::Certificates::CertificateSigningRequestCondition.new }

    def serialize
      {}.tap do |result|
        result[:certificate] = certificate
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :certificate_signing_request_status
    end
  end
end
