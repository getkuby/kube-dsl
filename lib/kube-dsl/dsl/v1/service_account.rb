# typed: true

module KubeDSL::DSL::V1
  class ServiceAccount < ::KubeDSL::DSLObject
    value_field :automount_service_account_token
    array_field(:image_pull_secret) { KubeDSL::DSL::V1::LocalObjectReference.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    array_field(:secret) { KubeDSL::DSL::V1::ObjectReference.new }

    validates :automount_service_account_token, field: { format: :boolean }, presence: false
    validates :image_pull_secrets, array: { kind_of: KubeDSL::DSL::V1::LocalObjectReference }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :secrets, array: { kind_of: KubeDSL::DSL::V1::ObjectReference }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:automountServiceAccountToken] = automount_service_account_token
        result[:imagePullSecrets] = image_pull_secrets.map(&:serialize)
        result[:kind] = "ServiceAccount"
        result[:metadata] = metadata.serialize
        result[:secrets] = secrets.map(&:serialize)
      end
    end

    def kind_sym
      :service_account
    end
  end
end
