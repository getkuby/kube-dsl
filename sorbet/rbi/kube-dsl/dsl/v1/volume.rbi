# typed: strict

module KubeDSL
  module DSL
    module V1
      class Volume < ::KubeDSL::DSLObject
        extend KubeDSL::ValueFields::ClassMethods
        extend KubeDSL::Validations::ClassMethods
        include KubeDSL::ValueFields::InstanceMethods

        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource) }
        def aws_elastic_block_store; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def aws_elastic_block_store_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::AzureDiskVolumeSource) }
        def azure_disk; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def azure_disk_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::AzureFileVolumeSource) }
        def azure_file; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def azure_file_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::CephFSVolumeSource) }
        def cephfs; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def cephfs_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::CinderVolumeSource) }
        def cinder; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def cinder_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ConfigMapVolumeSource) }
        def config_map; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def config_map_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::CSIVolumeSource) }
        def csi; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def csi_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::DownwardAPIVolumeSource) }
        def downward_api; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def downward_api_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::EmptyDirVolumeSource) }
        def empty_dir; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def empty_dir_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::EphemeralVolumeSource) }
        def ephemeral; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def ephemeral_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::FCVolumeSource) }
        def fc; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def fc_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::FlexVolumeSource) }
        def flex_volume; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def flex_volume_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::FlockerVolumeSource) }
        def flocker; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def flocker_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource) }
        def gce_persistent_disk; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def gce_persistent_disk_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::GitRepoVolumeSource) }
        def git_repo; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def git_repo_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::GlusterfsVolumeSource) }
        def glusterfs; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def glusterfs_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::HostPathVolumeSource) }
        def host_path; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def host_path_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ISCSIVolumeSource) }
        def iscsi; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def iscsi_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::NFSVolumeSource) }
        def nfs; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def nfs_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::PersistentVolumeClaimVolumeSource) }
        def persistent_volume_claim; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def persistent_volume_claim_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource) }
        def photon_persistent_disk; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def photon_persistent_disk_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::PortworxVolumeSource) }
        def portworx_volume; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def portworx_volume_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ProjectedVolumeSource) }
        def projected; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def projected_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::QuobyteVolumeSource) }
        def quobyte; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def quobyte_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::RBDVolumeSource) }
        def rbd; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def rbd_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ScaleIOVolumeSource) }
        def scale_io; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def scale_io_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::SecretVolumeSource) }
        def secret; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def secret_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::StorageOSVolumeSource) }
        def storageos; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def storageos_present?; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource) }
        def vsphere_volume; end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def vsphere_volume_present?; end
      end
    end
  end
end