module KubeDSL::DSL::Certificates::V1
  class CertificateSigningRequestList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Certificates::V1::CertificateSigningRequest.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Certificates::V1::CertificateSigningRequest }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "certificates.k8s.io/v1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "CertificateSigningRequestList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :certificate_signing_request_list
    end
  end
end
