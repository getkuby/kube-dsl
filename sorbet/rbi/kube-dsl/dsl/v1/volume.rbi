# typed: strict

module KubeDSL
  module DSL
    module V1
      class Volume < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource) }
        def aws_elastic_block_store; end

        sig { returns(KubeDSL::DSL::V1::AzureDiskVolumeSource) }
        def azure_disk; end

        sig { returns(KubeDSL::DSL::V1::AzureFileVolumeSource) }
        def azure_file; end

        sig { returns(KubeDSL::DSL::V1::CephFSVolumeSource) }
        def cephfs; end

        sig { returns(KubeDSL::DSL::V1::CinderVolumeSource) }
        def cinder; end

        sig { returns(KubeDSL::DSL::V1::ConfigMapVolumeSource) }
        def config_map; end

        sig { returns(KubeDSL::DSL::V1::CSIVolumeSource) }
        def csi; end

        sig { returns(KubeDSL::DSL::V1::DownwardAPIVolumeSource) }
        def downward_api; end

        sig { returns(KubeDSL::DSL::V1::EmptyDirVolumeSource) }
        def empty_dir; end

        sig { returns(KubeDSL::DSL::V1::EphemeralVolumeSource) }
        def ephemeral; end

        sig { returns(KubeDSL::DSL::V1::FCVolumeSource) }
        def fc; end

        sig { returns(KubeDSL::DSL::V1::FlexVolumeSource) }
        def flex_volume; end

        sig { returns(KubeDSL::DSL::V1::FlockerVolumeSource) }
        def flocker; end

        sig { returns(KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource) }
        def gce_persistent_disk; end

        sig { returns(KubeDSL::DSL::V1::GitRepoVolumeSource) }
        def git_repo; end

        sig { returns(KubeDSL::DSL::V1::GlusterfsVolumeSource) }
        def glusterfs; end

        sig { returns(KubeDSL::DSL::V1::HostPathVolumeSource) }
        def host_path; end

        sig { returns(KubeDSL::DSL::V1::ISCSIVolumeSource) }
        def iscsi; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { returns(KubeDSL::DSL::V1::NFSVolumeSource) }
        def nfs; end

        sig { returns(KubeDSL::DSL::V1::PersistentVolumeClaimVolumeSource) }
        def persistent_volume_claim; end

        sig { returns(KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource) }
        def photon_persistent_disk; end

        sig { returns(KubeDSL::DSL::V1::PortworxVolumeSource) }
        def portworx_volume; end

        sig { returns(KubeDSL::DSL::V1::ProjectedVolumeSource) }
        def projected; end

        sig { returns(KubeDSL::DSL::V1::QuobyteVolumeSource) }
        def quobyte; end

        sig { returns(KubeDSL::DSL::V1::RBDVolumeSource) }
        def rbd; end

        sig { returns(KubeDSL::DSL::V1::ScaleIOVolumeSource) }
        def scale_io; end

        sig { returns(KubeDSL::DSL::V1::SecretVolumeSource) }
        def secret; end

        sig { returns(KubeDSL::DSL::V1::StorageOSVolumeSource) }
        def storageos; end

        sig { returns(KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource) }
        def vsphere_volume; end
      end
    end
  end
end