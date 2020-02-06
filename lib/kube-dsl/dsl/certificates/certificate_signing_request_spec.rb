module KubeDSL::DSL::Certificates
  class CertificateSigningRequestSpec
    extend ::KubeDSL::ValueFields
    value_fields :request, :uid, :username
    array_field :group
    array_field :usage
    object_field(:extra) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:request] = request
        result[:uid] = uid
        result[:username] = username
        result[:groups] = groups
        result[:usages] = usages
        result[:extra] = extra.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
