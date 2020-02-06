module KubeDSL::DSL::Certificates
  class CertificateSigningRequest
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Certificates::CertificateSigningRequestSpec.new }
    object_field(:status) { KubeDSL::DSL::Certificates::CertificateSigningRequestStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "certificates.k8s.io/v1beta1"
        result[:kind] = "CertificateSigningRequest"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :certificate_signing_request
    end
  end
end
