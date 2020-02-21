module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequest
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Certificates::V1beta1::CertificateSigningRequestSpec.new }
    object_field(:status) { KubeDSL::DSL::Certificates::V1beta1::CertificateSigningRequestStatus.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
