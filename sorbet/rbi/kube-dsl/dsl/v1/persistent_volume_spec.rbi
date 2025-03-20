# typed: strict

module KubeDSL
  module DSL
    module V1
      class PersistentVolumeSpec < ::KubeDSL::DSLObject
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

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def access_modes(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource).void)).returns(KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource) }
        def aws_elastic_block_store(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def aws_elastic_block_store_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::AzureDiskVolumeSource).void)).returns(KubeDSL::DSL::V1::AzureDiskVolumeSource) }
        def azure_disk(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def azure_disk_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::AzureFilePersistentVolumeSource).void)).returns(KubeDSL::DSL::V1::AzureFilePersistentVolumeSource) }
        def azure_file(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def azure_file_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(::KubeDSL::KeyValueFields).void)).returns(::KubeDSL::KeyValueFields) }
        def capacity(&block); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::CephFSPersistentVolumeSource).void)).returns(KubeDSL::DSL::V1::CephFSPersistentVolumeSource) }
        def cephfs(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def cephfs_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::CinderPersistentVolumeSource).void)).returns(KubeDSL::DSL::V1::CinderPersistentVolumeSource) }
        def cinder(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def cinder_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ObjectReference).void)).returns(KubeDSL::DSL::V1::ObjectReference) }
        def claim_ref(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def claim_ref_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::CSIPersistentVolumeSource).void)).returns(KubeDSL::DSL::V1::CSIPersistentVolumeSource) }
        def csi(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def csi_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::FCVolumeSource).void)).returns(KubeDSL::DSL::V1::FCVolumeSource) }
        def fc(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def fc_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::FlexPersistentVolumeSource).void)).returns(KubeDSL::DSL::V1::FlexPersistentVolumeSource) }
        def flex_volume(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def flex_volume_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::FlockerVolumeSource).void)).returns(KubeDSL::DSL::V1::FlockerVolumeSource) }
        def flocker(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def flocker_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource).void)).returns(KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource) }
        def gce_persistent_disk(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def gce_persistent_disk_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::GlusterfsPersistentVolumeSource).void)).returns(KubeDSL::DSL::V1::GlusterfsPersistentVolumeSource) }
        def glusterfs(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def glusterfs_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::HostPathVolumeSource).void)).returns(KubeDSL::DSL::V1::HostPathVolumeSource) }
        def host_path(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def host_path_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ISCSIPersistentVolumeSource).void)).returns(KubeDSL::DSL::V1::ISCSIPersistentVolumeSource) }
        def iscsi(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def iscsi_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::LocalVolumeSource).void)).returns(KubeDSL::DSL::V1::LocalVolumeSource) }
        def local(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def local_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def mount_options(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::NFSVolumeSource).void)).returns(KubeDSL::DSL::V1::NFSVolumeSource) }
        def nfs(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def nfs_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::VolumeNodeAffinity).void)).returns(KubeDSL::DSL::V1::VolumeNodeAffinity) }
        def node_affinity(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def node_affinity_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def persistent_volume_reclaim_policy(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource).void)).returns(KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource) }
        def photon_persistent_disk(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def photon_persistent_disk_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::PortworxVolumeSource).void)).returns(KubeDSL::DSL::V1::PortworxVolumeSource) }
        def portworx_volume(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def portworx_volume_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::QuobyteVolumeSource).void)).returns(KubeDSL::DSL::V1::QuobyteVolumeSource) }
        def quobyte(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def quobyte_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::RBDPersistentVolumeSource).void)).returns(KubeDSL::DSL::V1::RBDPersistentVolumeSource) }
        def rbd(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def rbd_present?; end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::ScaleIOPersistentVolumeSource).void)).returns(KubeDSL::DSL::V1::ScaleIOPersistentVolumeSource) }
        def scale_io(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def scale_io_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def storage_class_name(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::StorageOSPersistentVolumeSource).void)).returns(KubeDSL::DSL::V1::StorageOSPersistentVolumeSource) }
        def storageos(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def storageos_present?; end

        T::Sig::WithoutRuntime.sig { params(val: T.nilable(String)).returns(T.nilable(String)) }
        def volume_mode(val = nil); end

        T::Sig::WithoutRuntime.sig { params(block: T.nilable(T.proc.bind(KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource).void)).returns(KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource) }
        def vsphere_volume(&block); end
        
        T::Sig::WithoutRuntime.sig { returns(T::Boolean) }
        def vsphere_volume_present?; end
      end
    end
  end
end