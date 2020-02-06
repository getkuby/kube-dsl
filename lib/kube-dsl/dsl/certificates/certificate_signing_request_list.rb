module KubeDSL::DSL::Certificates
  class CertificateSigningRequestList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::Certificates::CertificateSigningRequest.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "certificates.k8s.io/v1beta1"
        result[:kind] = "CertificateSigningRequestList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
