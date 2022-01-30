# typed: true

module KubeDSL::DSL::V1
  class ISCSIPersistentVolumeSource < ::KubeDSL::DSLObject
    value_field :chap_auth_discovery
    value_field :chap_auth_session
    value_field :fs_type
    value_field :initiator_name
    value_field :iqn
    value_field :iscsi_interface
    value_field :lun
    value_field :portals
    value_field :read_only
    object_field(:secret_ref) { KubeDSL::DSL::V1::SecretReference.new }
    value_field :target_portal

    validates :chap_auth_discovery, field: { format: :boolean }, presence: false
    validates :chap_auth_session, field: { format: :boolean }, presence: false
    validates :fs_type, field: { format: :string }, presence: false
    validates :initiator_name, field: { format: :string }, presence: false
    validates :iqn, field: { format: :string }, presence: false
    validates :iscsi_interface, field: { format: :string }, presence: false
    validates :lun, field: { format: :integer }, presence: false
    validates :portals, field: { format: :string }, presence: false
    validates :read_only, field: { format: :boolean }, presence: false
    validates :secret_ref, object: { kind_of: KubeDSL::DSL::V1::SecretReference }
    validates :target_portal, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:chapAuthDiscovery] = chap_auth_discovery
        result[:chapAuthSession] = chap_auth_session
        result[:fsType] = fs_type
        result[:initiatorName] = initiator_name
        result[:iqn] = iqn
        result[:iscsiInterface] = iscsi_interface
        result[:lun] = lun
        result[:portals] = portals
        result[:readOnly] = read_only
        result[:secretRef] = secret_ref.serialize
        result[:targetPortal] = target_portal
      end
    end

    def kind_sym
      :iscsi_persistent_volume_source
    end
  end
end
