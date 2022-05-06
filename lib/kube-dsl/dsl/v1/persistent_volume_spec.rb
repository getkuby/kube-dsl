# typed: true

module KubeDSL
  module DSL
    module V1
      class PersistentVolumeSpec < ::KubeDSL::DSLObject
        value_field :access_modes
        object_field(:aws_elastic_block_store) { KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource.new }
        object_field(:azure_disk) { KubeDSL::DSL::V1::AzureDiskVolumeSource.new }
        object_field(:azure_file) { KubeDSL::DSL::V1::AzureFilePersistentVolumeSource.new }
        key_value_field(:capacity, format: :string)
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
        value_field :mount_options
        object_field(:nfs) { KubeDSL::DSL::V1::NFSVolumeSource.new }
        object_field(:node_affinity) { KubeDSL::DSL::V1::VolumeNodeAffinity.new }
        value_field :persistent_volume_reclaim_policy
        object_field(:photon_persistent_disk) { KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource.new }
        object_field(:portworx_volume) { KubeDSL::DSL::V1::PortworxVolumeSource.new }
        object_field(:quobyte) { KubeDSL::DSL::V1::QuobyteVolumeSource.new }
        object_field(:rbd) { KubeDSL::DSL::V1::RBDPersistentVolumeSource.new }
        object_field(:scale_io) { KubeDSL::DSL::V1::ScaleIOPersistentVolumeSource.new }
        value_field :storage_class_name
        object_field(:storageos) { KubeDSL::DSL::V1::StorageOSPersistentVolumeSource.new }
        value_field :volume_mode
        object_field(:vsphere_volume) { KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource.new }

        validates :access_modes, field: { format: :string }, presence: false
        validates :aws_elastic_block_store, object: { kind_of: KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource }
        validates :azure_disk, object: { kind_of: KubeDSL::DSL::V1::AzureDiskVolumeSource }
        validates :azure_file, object: { kind_of: KubeDSL::DSL::V1::AzureFilePersistentVolumeSource }
        validates :capacity, kv: { value_format: :string }, presence: false
        validates :cephfs, object: { kind_of: KubeDSL::DSL::V1::CephFSPersistentVolumeSource }
        validates :cinder, object: { kind_of: KubeDSL::DSL::V1::CinderPersistentVolumeSource }
        validates :claim_ref, object: { kind_of: KubeDSL::DSL::V1::ObjectReference }
        validates :csi, object: { kind_of: KubeDSL::DSL::V1::CSIPersistentVolumeSource }
        validates :fc, object: { kind_of: KubeDSL::DSL::V1::FCVolumeSource }
        validates :flex_volume, object: { kind_of: KubeDSL::DSL::V1::FlexPersistentVolumeSource }
        validates :flocker, object: { kind_of: KubeDSL::DSL::V1::FlockerVolumeSource }
        validates :gce_persistent_disk, object: { kind_of: KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource }
        validates :glusterfs, object: { kind_of: KubeDSL::DSL::V1::GlusterfsPersistentVolumeSource }
        validates :host_path, object: { kind_of: KubeDSL::DSL::V1::HostPathVolumeSource }
        validates :iscsi, object: { kind_of: KubeDSL::DSL::V1::ISCSIPersistentVolumeSource }
        validates :local, object: { kind_of: KubeDSL::DSL::V1::LocalVolumeSource }
        validates :mount_options, field: { format: :string }, presence: false
        validates :nfs, object: { kind_of: KubeDSL::DSL::V1::NFSVolumeSource }
        validates :node_affinity, object: { kind_of: KubeDSL::DSL::V1::VolumeNodeAffinity }
        validates :persistent_volume_reclaim_policy, field: { format: :string }, presence: false
        validates :photon_persistent_disk, object: { kind_of: KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource }
        validates :portworx_volume, object: { kind_of: KubeDSL::DSL::V1::PortworxVolumeSource }
        validates :quobyte, object: { kind_of: KubeDSL::DSL::V1::QuobyteVolumeSource }
        validates :rbd, object: { kind_of: KubeDSL::DSL::V1::RBDPersistentVolumeSource }
        validates :scale_io, object: { kind_of: KubeDSL::DSL::V1::ScaleIOPersistentVolumeSource }
        validates :storage_class_name, field: { format: :string }, presence: false
        validates :storageos, object: { kind_of: KubeDSL::DSL::V1::StorageOSPersistentVolumeSource }
        validates :volume_mode, field: { format: :string }, presence: false
        validates :vsphere_volume, object: { kind_of: KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource }

        def serialize
          {}.tap do |result|
            result[:accessModes] = access_modes
            result[:awsElasticBlockStore] = aws_elastic_block_store.serialize
            result[:azureDisk] = azure_disk.serialize
            result[:azureFile] = azure_file.serialize
            result[:capacity] = capacity.serialize
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
            result[:mountOptions] = mount_options
            result[:nfs] = nfs.serialize
            result[:nodeAffinity] = node_affinity.serialize
            result[:persistentVolumeReclaimPolicy] = persistent_volume_reclaim_policy
            result[:photonPersistentDisk] = photon_persistent_disk.serialize
            result[:portworxVolume] = portworx_volume.serialize
            result[:quobyte] = quobyte.serialize
            result[:rbd] = rbd.serialize
            result[:scaleIO] = scale_io.serialize
            result[:storageClassName] = storage_class_name
            result[:storageos] = storageos.serialize
            result[:volumeMode] = volume_mode
            result[:vsphereVolume] = vsphere_volume.serialize
          end
        end

        def kind_sym
          :persistent_volume_spec
        end
      end
    end
  end
end