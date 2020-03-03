module KubeDSL::DSL::V1
  class ISCSIPersistentVolumeSource < ::KubeDSL::DSLObject
    value_fields :chap_auth_discovery, :chap_auth_session, :fs_type, :initiator_name, :iqn, :iscsi_interface, :lun, :read_only, :target_portal
    array_field :portal
    object_field(:secret_ref) { KubeDSL::DSL::V1::SecretReference.new }

    def serialize
      {}.tap do |result|
        result[:chapAuthDiscovery] = chap_auth_discovery
        result[:chapAuthSession] = chap_auth_session
        result[:fsType] = fs_type
        result[:initiatorName] = initiator_name
        result[:iqn] = iqn
        result[:iscsiInterface] = iscsi_interface
        result[:lun] = lun
        result[:readOnly] = read_only
        result[:targetPortal] = target_portal
        result[:portals] = portals
        result[:secretRef] = secret_ref.serialize
      end
    end

    def kind
      :iscsi_persistent_volume_source
    end
  end
end
