# typed: strict

module KubeDSL
  module DSL
    module V1
      class PersistentVolumeSpec < ::KubeDSL::DSLObject
        T::Sig::WithoutRuntime.sig {
          returns(
            T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
          )
        }
        def serialize; end

        T::Sig::WithoutRuntime.sig { returns(Symbol) }
        def kind_sym; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def access_modes(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource) }
        def aws_elastic_block_store; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::AzureDiskVolumeSource) }
        def azure_disk; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::AzureFilePersistentVolumeSource) }
        def azure_file; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def capacity(&block); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::CephFSPersistentVolumeSource) }
        def cephfs; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::CinderPersistentVolumeSource) }
        def cinder; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ObjectReference) }
        def claim_ref; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::CSIPersistentVolumeSource) }
        def csi; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::FCVolumeSource) }
        def fc; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::FlexPersistentVolumeSource) }
        def flex_volume; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::FlockerVolumeSource) }
        def flocker; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource) }
        def gce_persistent_disk; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::GlusterfsPersistentVolumeSource) }
        def glusterfs; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::HostPathVolumeSource) }
        def host_path; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ISCSIPersistentVolumeSource) }
        def iscsi; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::LocalVolumeSource) }
        def local; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def mount_options(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::NFSVolumeSource) }
        def nfs; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::VolumeNodeAffinity) }
        def node_affinity; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def persistent_volume_reclaim_policy(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource) }
        def photon_persistent_disk; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::PortworxVolumeSource) }
        def portworx_volume; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::QuobyteVolumeSource) }
        def quobyte; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::RBDPersistentVolumeSource) }
        def rbd; end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::ScaleIOPersistentVolumeSource) }
        def scale_io; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def storage_class_name(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::StorageOSPersistentVolumeSource) }
        def storageos; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(String) }
        def volume_mode(val = nil); end

        T::Sig::WithoutRuntime.sig { returns(KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource) }
        def vsphere_volume; end
      end
    end
  end
end