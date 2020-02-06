module KubeDSL::DSL
  class Volume
    extend ::KubeDSL::ValueFields
    value_fields :name
    object_field(:aws_elastic_block_store) { KubeDSL::DSL::AWSElasticBlockStoreVolumeSource.new }
    object_field(:azure_disk) { KubeDSL::DSL::AzureDiskVolumeSource.new }
    object_field(:azure_file) { KubeDSL::DSL::AzureFileVolumeSource.new }
    object_field(:cephfs) { KubeDSL::DSL::CephFSVolumeSource.new }
    object_field(:cinder) { KubeDSL::DSL::CinderVolumeSource.new }
    object_field(:config_map) { KubeDSL::DSL::ConfigMapVolumeSource.new }
    object_field(:csi) { KubeDSL::DSL::CSIVolumeSource.new }
    object_field(:downward_api) { KubeDSL::DSL::DownwardAPIVolumeSource.new }
    object_field(:empty_dir) { KubeDSL::DSL::EmptyDirVolumeSource.new }
    object_field(:fc) { KubeDSL::DSL::FCVolumeSource.new }
    object_field(:flex_volume) { KubeDSL::DSL::FlexVolumeSource.new }
    object_field(:flocker) { KubeDSL::DSL::FlockerVolumeSource.new }
    object_field(:gce_persistent_disk) { KubeDSL::DSL::GCEPersistentDiskVolumeSource.new }
    object_field(:git_repo) { KubeDSL::DSL::GitRepoVolumeSource.new }
    object_field(:glusterfs) { KubeDSL::DSL::GlusterfsVolumeSource.new }
    object_field(:host_path) { KubeDSL::DSL::HostPathVolumeSource.new }
    object_field(:iscsi) { KubeDSL::DSL::ISCSIVolumeSource.new }
    object_field(:nfs) { KubeDSL::DSL::NFSVolumeSource.new }
    object_field(:persistent_volume_claim) { KubeDSL::DSL::PersistentVolumeClaimVolumeSource.new }
    object_field(:photon_persistent_disk) { KubeDSL::DSL::PhotonPersistentDiskVolumeSource.new }
    object_field(:portworx_volume) { KubeDSL::DSL::PortworxVolumeSource.new }
    object_field(:projected) { KubeDSL::DSL::ProjectedVolumeSource.new }
    object_field(:quobyte) { KubeDSL::DSL::QuobyteVolumeSource.new }
    object_field(:rbd) { KubeDSL::DSL::RBDVolumeSource.new }
    object_field(:scale_io) { KubeDSL::DSL::ScaleIOVolumeSource.new }
    object_field(:secret) { KubeDSL::DSL::SecretVolumeSource.new }
    object_field(:storageos) { KubeDSL::DSL::StorageOSVolumeSource.new }
    object_field(:vsphere_volume) { KubeDSL::DSL::VsphereVirtualDiskVolumeSource.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:awsElasticBlockStore] = aws_elastic_block_store.serialize
        result[:azureDisk] = azure_disk.serialize
        result[:azureFile] = azure_file.serialize
        result[:cephfs] = cephfs.serialize
        result[:cinder] = cinder.serialize
        result[:configMap] = config_map.serialize
        result[:csi] = csi.serialize
        result[:downwardAPI] = downward_api.serialize
        result[:emptyDir] = empty_dir.serialize
        result[:fc] = fc.serialize
        result[:flexVolume] = flex_volume.serialize
        result[:flocker] = flocker.serialize
        result[:gcePersistentDisk] = gce_persistent_disk.serialize
        result[:gitRepo] = git_repo.serialize
        result[:glusterfs] = glusterfs.serialize
        result[:hostPath] = host_path.serialize
        result[:iscsi] = iscsi.serialize
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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
