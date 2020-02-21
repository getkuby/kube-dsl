module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequestStatus
    extend ::KubeDSL::ValueFields

    value_fields :certificate
    array_field(:condition) { KubeDSL::DSL::Certificates::V1beta1::CertificateSigningRequestCondition.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
