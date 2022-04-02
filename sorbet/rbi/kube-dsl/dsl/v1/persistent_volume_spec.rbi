# typed: strict

module KubeDSL
  module DSL
    module V1
      class PersistentVolumeSpec < ::KubeDSL::DSLObject
        sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def access_modes(val = nil); end

        sig { returns(KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource) }
        def aws_elastic_block_store; end

        sig { returns(KubeDSL::DSL::V1::AzureDiskVolumeSource) }
        def azure_disk; end

        sig { returns(KubeDSL::DSL::V1::AzureFilePersistentVolumeSource) }
        def azure_file; end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def capacity(&block); end

        sig { returns(KubeDSL::DSL::V1::CephFSPersistentVolumeSource) }
        def cephfs; end

        sig { returns(KubeDSL::DSL::V1::CinderPersistentVolumeSource) }
        def cinder; end

        sig { returns(KubeDSL::DSL::V1::ObjectReference) }
        def claim_ref; end

        sig { returns(KubeDSL::DSL::V1::CSIPersistentVolumeSource) }
        def csi; end

        sig { returns(KubeDSL::DSL::V1::FCVolumeSource) }
        def fc; end

        sig { returns(KubeDSL::DSL::V1::FlexPersistentVolumeSource) }
        def flex_volume; end

        sig { returns(KubeDSL::DSL::V1::FlockerVolumeSource) }
        def flocker; end

        sig { returns(KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource) }
        def gce_persistent_disk; end

        sig { returns(KubeDSL::DSL::V1::GlusterfsPersistentVolumeSource) }
        def glusterfs; end

        sig { returns(KubeDSL::DSL::V1::HostPathVolumeSource) }
        def host_path; end

        sig { returns(KubeDSL::DSL::V1::ISCSIPersistentVolumeSource) }
        def iscsi; end

        sig { returns(KubeDSL::DSL::V1::LocalVolumeSource) }
        def local; end

        sig { params(val: T.nilable(String)).returns(String) }
        def mount_options(val = nil); end

        sig { returns(KubeDSL::DSL::V1::NFSVolumeSource) }
        def nfs; end

        sig { returns(KubeDSL::DSL::V1::VolumeNodeAffinity) }
        def node_affinity; end

        sig { params(val: T.nilable(String)).returns(String) }
        def persistent_volume_reclaim_policy(val = nil); end

        sig { returns(KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource) }
        def photon_persistent_disk; end

        sig { returns(KubeDSL::DSL::V1::PortworxVolumeSource) }
        def portworx_volume; end

        sig { returns(KubeDSL::DSL::V1::QuobyteVolumeSource) }
        def quobyte; end

        sig { returns(KubeDSL::DSL::V1::RBDPersistentVolumeSource) }
        def rbd; end

        sig { returns(KubeDSL::DSL::V1::ScaleIOPersistentVolumeSource) }
        def scale_io; end

        sig { params(val: T.nilable(String)).returns(String) }
        def storage_class_name(val = nil); end

        sig { returns(KubeDSL::DSL::V1::StorageOSPersistentVolumeSource) }
        def storageos; end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_mode(val = nil); end

        sig { returns(KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource) }
        def vsphere_volume; end
      end
    end
  end
end