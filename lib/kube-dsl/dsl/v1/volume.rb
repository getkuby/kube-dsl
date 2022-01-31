# typed: true

module KubeDSL::DSL::V1
  class Volume < ::KubeDSL::DSLObject
    object_field(:aws_elastic_block_store) { KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource.new }
    object_field(:azure_disk) { KubeDSL::DSL::V1::AzureDiskVolumeSource.new }
    object_field(:azure_file) { KubeDSL::DSL::V1::AzureFileVolumeSource.new }
    object_field(:cephfs) { KubeDSL::DSL::V1::CephFSVolumeSource.new }
    object_field(:cinder) { KubeDSL::DSL::V1::CinderVolumeSource.new }
    object_field(:config_map) { KubeDSL::DSL::V1::ConfigMapVolumeSource.new }
    object_field(:csi) { KubeDSL::DSL::V1::CSIVolumeSource.new }
    object_field(:downward_api) { KubeDSL::DSL::V1::DownwardAPIVolumeSource.new }
    object_field(:empty_dir) { KubeDSL::DSL::V1::EmptyDirVolumeSource.new }
    object_field(:ephemeral) { KubeDSL::DSL::V1::EphemeralVolumeSource.new }
    object_field(:fc) { KubeDSL::DSL::V1::FCVolumeSource.new }
    object_field(:flex_volume) { KubeDSL::DSL::V1::FlexVolumeSource.new }
    object_field(:flocker) { KubeDSL::DSL::V1::FlockerVolumeSource.new }
    object_field(:gce_persistent_disk) { KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource.new }
    object_field(:git_repo) { KubeDSL::DSL::V1::GitRepoVolumeSource.new }
    object_field(:glusterfs) { KubeDSL::DSL::V1::GlusterfsVolumeSource.new }
    object_field(:host_path) { KubeDSL::DSL::V1::HostPathVolumeSource.new }
    object_field(:iscsi) { KubeDSL::DSL::V1::ISCSIVolumeSource.new }
    value_field :name
    object_field(:nfs) { KubeDSL::DSL::V1::NFSVolumeSource.new }
    object_field(:persistent_volume_claim) { KubeDSL::DSL::V1::PersistentVolumeClaimVolumeSource.new }
    object_field(:photon_persistent_disk) { KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource.new }
    object_field(:portworx_volume) { KubeDSL::DSL::V1::PortworxVolumeSource.new }
    object_field(:projected) { KubeDSL::DSL::V1::ProjectedVolumeSource.new }
    object_field(:quobyte) { KubeDSL::DSL::V1::QuobyteVolumeSource.new }
    object_field(:rbd) { KubeDSL::DSL::V1::RBDVolumeSource.new }
    object_field(:scale_io) { KubeDSL::DSL::V1::ScaleIOVolumeSource.new }
    object_field(:secret) { KubeDSL::DSL::V1::SecretVolumeSource.new }
    object_field(:storageos) { KubeDSL::DSL::V1::StorageOSVolumeSource.new }
    object_field(:vsphere_volume) { KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource.new }

    validates :aws_elastic_block_store, object: { kind_of: KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource }
    validates :azure_disk, object: { kind_of: KubeDSL::DSL::V1::AzureDiskVolumeSource }
    validates :azure_file, object: { kind_of: KubeDSL::DSL::V1::AzureFileVolumeSource }
    validates :cephfs, object: { kind_of: KubeDSL::DSL::V1::CephFSVolumeSource }
    validates :cinder, object: { kind_of: KubeDSL::DSL::V1::CinderVolumeSource }
    validates :config_map, object: { kind_of: KubeDSL::DSL::V1::ConfigMapVolumeSource }
    validates :csi, object: { kind_of: KubeDSL::DSL::V1::CSIVolumeSource }
    validates :downward_api, object: { kind_of: KubeDSL::DSL::V1::DownwardAPIVolumeSource }
    validates :empty_dir, object: { kind_of: KubeDSL::DSL::V1::EmptyDirVolumeSource }
    validates :ephemeral, object: { kind_of: KubeDSL::DSL::V1::EphemeralVolumeSource }
    validates :fc, object: { kind_of: KubeDSL::DSL::V1::FCVolumeSource }
    validates :flex_volume, object: { kind_of: KubeDSL::DSL::V1::FlexVolumeSource }
    validates :flocker, object: { kind_of: KubeDSL::DSL::V1::FlockerVolumeSource }
    validates :gce_persistent_disk, object: { kind_of: KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource }
    validates :git_repo, object: { kind_of: KubeDSL::DSL::V1::GitRepoVolumeSource }
    validates :glusterfs, object: { kind_of: KubeDSL::DSL::V1::GlusterfsVolumeSource }
    validates :host_path, object: { kind_of: KubeDSL::DSL::V1::HostPathVolumeSource }
    validates :iscsi, object: { kind_of: KubeDSL::DSL::V1::ISCSIVolumeSource }
    validates :name, field: { format: :string }, presence: false
    validates :nfs, object: { kind_of: KubeDSL::DSL::V1::NFSVolumeSource }
    validates :persistent_volume_claim, object: { kind_of: KubeDSL::DSL::V1::PersistentVolumeClaimVolumeSource }
    validates :photon_persistent_disk, object: { kind_of: KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource }
    validates :portworx_volume, object: { kind_of: KubeDSL::DSL::V1::PortworxVolumeSource }
    validates :projected, object: { kind_of: KubeDSL::DSL::V1::ProjectedVolumeSource }
    validates :quobyte, object: { kind_of: KubeDSL::DSL::V1::QuobyteVolumeSource }
    validates :rbd, object: { kind_of: KubeDSL::DSL::V1::RBDVolumeSource }
    validates :scale_io, object: { kind_of: KubeDSL::DSL::V1::ScaleIOVolumeSource }
    validates :secret, object: { kind_of: KubeDSL::DSL::V1::SecretVolumeSource }
    validates :storageos, object: { kind_of: KubeDSL::DSL::V1::StorageOSVolumeSource }
    validates :vsphere_volume, object: { kind_of: KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource }

    def serialize
      {}.tap do |result|
        result[:awsElasticBlockStore] = aws_elastic_block_store.serialize
        result[:azureDisk] = azure_disk.serialize
        result[:azureFile] = azure_file.serialize
        result[:cephfs] = cephfs.serialize
        result[:cinder] = cinder.serialize
        result[:configMap] = config_map.serialize
        result[:csi] = csi.serialize
        result[:downwardAPI] = downward_api.serialize
        result[:emptyDir] = empty_dir.serialize
        result[:ephemeral] = ephemeral.serialize
        result[:fc] = fc.serialize
        result[:flexVolume] = flex_volume.serialize
        result[:flocker] = flocker.serialize
        result[:gcePersistentDisk] = gce_persistent_disk.serialize
        result[:gitRepo] = git_repo.serialize
        result[:glusterfs] = glusterfs.serialize
        result[:hostPath] = host_path.serialize
        result[:iscsi] = iscsi.serialize
        result[:name] = name
        result[:nfs] = nfs.serialize
        result[:persistentVolumeClaim] = persistent_volume_claim.serialize
        result[:photonPersistentDisk] = photon_persistent_disk.serialize
        result[:portworxVolume] = portworx_volume.serialize
        result[:projected] = projected.serialize
        result[:quobyte] = quobyte.serialize
        result[:rbd] = rbd.serialize
        result[:scaleIO] = scale_io.serialize
        result[:secret] = secret.serialize
        result[:storageos] = storageos.serialize
        result[:vsphereVolume] = vsphere_volume.serialize
      end
    end

    def kind_sym
      :volume
    end
  end
end
