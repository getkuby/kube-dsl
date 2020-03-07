module KubeDSL::DSL::V1
  class PersistentVolumeSpec < ::KubeDSL::DSLObject
    value_fields :persistent_volume_reclaim_policy, :storage_class_name, :volume_mode
    array_field :access_mode
    array_field :mount_option
    object_field(:aws_elastic_block_store) { KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource.new }
    object_field(:azure_disk) { KubeDSL::DSL::V1::AzureDiskVolumeSource.new }
    object_field(:azure_file) { KubeDSL::DSL::V1::AzureFilePersistentVolumeSource.new }
    object_field(:cephfs) { KubeDSL::DSL::V1::CephFSPersistentVolumeSource.new }
    object_field(:cinder) { KubeDSL::DSL::V1::CinderPersistentVolumeSource.new }
    object_field(:claim_ref) { KubeDSL::DSL::V1::ObjectReference.new }
    object_field(:csi) { KubeDSL::DSL::V1::CSIPersistentVolumeSource.new }
    object_field(:fc) { KubeDSL::DSL::V1::FCVolumeSource.new }
    object_field(:flex_volume) { KubeDSL::DSL::V1::FlexPersistentVolumeSource.new }
    object_field(:flocker) { KubeDSL::DSL::V1::FlockerVolumeSource.new }
    object_field(:gce_persistent_disk) { KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource.new }
    object_field(:glusterfs) { KubeDSL::DSL::V1::GlusterfsPersistentVolumeSource.new }
    object_field(:host_path) { KubeDSL::DSL::V1::HostPathVolumeSource.new }
    object_field(:iscsi) { KubeDSL::DSL::V1::ISCSIPersistentVolumeSource.new }
    object_field(:local) { KubeDSL::DSL::V1::LocalVolumeSource.new }
    object_field(:nfs) { KubeDSL::DSL::V1::NFSVolumeSource.new }
    object_field(:node_affinity) { KubeDSL::DSL::V1::VolumeNodeAffinity.new }
    object_field(:photon_persistent_disk) { KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource.new }
    object_field(:portworx_volume) { KubeDSL::DSL::V1::PortworxVolumeSource.new }
    object_field(:quobyte) { KubeDSL::DSL::V1::QuobyteVolumeSource.new }
    object_field(:rbd) { KubeDSL::DSL::V1::RBDPersistentVolumeSource.new }
    object_field(:scale_io) { KubeDSL::DSL::V1::ScaleIOPersistentVolumeSource.new }
    object_field(:storageos) { KubeDSL::DSL::V1::StorageOSPersistentVolumeSource.new }
    object_field(:vsphere_volume) { KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource.new }
    object_field(:capacity) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:persistentVolumeReclaimPolicy] = persistent_volume_reclaim_policy
        result[:storageClassName] = storage_class_name
        result[:volumeMode] = volume_mode
        result[:accessModes] = access_modes
        result[:mountOptions] = mount_options
        result[:awsElasticBlockStore] = aws_elastic_block_store.serialize
        result[:azureDisk] = azure_disk.serialize
        result[:azureFile] = azure_file.serialize
        result[:cephfs] = cephfs.serialize
        result[:cinder] = cinder.serialize
        result[:claimRef] = claim_ref.serialize
        result[:csi] = csi.serialize
        result[:fc] = fc.serialize
        result[:flexVolume] = flex_volume.serialize
        result[:flocker] = flocker.serialize
        result[:gcePersistentDisk] = gce_persistent_disk.serialize
        result[:glusterfs] = glusterfs.serialize
        result[:hostPath] = host_path.serialize
        result[:iscsi] = iscsi.serialize
        result[:local] = local.serialize
        result[:nfs] = nfs.serialize
        result[:nodeAffinity] = node_affinity.serialize
        result[:photonPersistentDisk] = photon_persistent_disk.serialize
        result[:portworxVolume] = portworx_volume.serialize
        result[:quobyte] = quobyte.serialize
        result[:rbd] = rbd.serialize
        result[:scaleIO] = scale_io.serialize
        result[:storageos] = storageos.serialize
        result[:vsphereVolume] = vsphere_volume.serialize
        result[:capacity] = capacity.serialize
      end
    end

    def kind_sym
      :persistent_volume_spec
    end
  end
end
