module KubeDSL::DSL::Apiserverinternal::V1alpha1
  class ServerStorageVersion < ::KubeDSL::DSLObject
    value_field :api_server_id
    value_field :decodable_versions
    value_field :encoding_version

    validates :api_server_id, field: { format: :string }, presence: false
    validates :decodable_versions, field: { format: :string }, presence: false
    validates :encoding_version, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiServerID] = api_server_id
        result[:decodableVersions] = decodable_versions
        result[:encodingVersion] = encoding_version
      end
    end

    def kind_sym
      :server_storage_version
    end
  end
end
