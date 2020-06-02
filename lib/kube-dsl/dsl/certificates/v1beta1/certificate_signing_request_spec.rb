module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequestSpec < ::KubeDSL::DSLObject
    value_fields :groups, :request, :uid, :usages, :username
    object_field(:extra) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:groups] = groups
        result[:request] = request
        result[:uid] = uid
        result[:usages] = usages
        result[:username] = username
        result[:extra] = extra.serialize
      end
    end

    def kind_sym
      :certificate_signing_request_spec
    end
  end
end
