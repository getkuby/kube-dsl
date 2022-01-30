# typed: true

module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequest < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Certificates::V1beta1::CertificateSigningRequestSpec.new }
    object_field(:status) { KubeDSL::DSL::Certificates::V1beta1::CertificateSigningRequestStatus.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Certificates::V1beta1::CertificateSigningRequestSpec }
    validates :status, object: { kind_of: KubeDSL::DSL::Certificates::V1beta1::CertificateSigningRequestStatus }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "certificates.k8s.io/v1beta1"
        result[:kind] = "CertificateSigningRequest"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :certificate_signing_request
    end
  end
end
