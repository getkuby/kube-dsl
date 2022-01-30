# typed: true

module KubeDSL::DSL::Certificates::V1beta1
  class CertificateSigningRequestSpec < ::KubeDSL::DSLObject
    key_value_field(:extra, format: :string)
    value_field :groups
    value_field :request
    value_field :uid
    value_field :usages
    value_field :username

    validates :extra, kv: { value_format: :string }, presence: false
    validates :groups, field: { format: :string }, presence: false
    validates :request, field: { format: :string }, presence: false
    validates :uid, field: { format: :string }, presence: false
    validates :usages, field: { format: :string }, presence: false
    validates :username, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:extra] = extra.serialize
        result[:groups] = groups
        result[:request] = request
        result[:uid] = uid
        result[:usages] = usages
        result[:username] = username
      end
    end

    def kind_sym
      :certificate_signing_request_spec
    end
  end
end
