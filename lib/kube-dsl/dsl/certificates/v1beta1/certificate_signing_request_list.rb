module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequestList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Certificates::V1beta1::CertificateSigningRequest.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :certificate_signing_request_list
    end
  end
end
