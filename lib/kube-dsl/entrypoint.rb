module KubeDSL::Entrypoint
  def aws_elastic_block_store_volume_source(&block)
    ::KubeDSL::DSL::AWSElasticBlockStoreVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def affinity(&block)
    ::KubeDSL::DSL::Affinity.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def attached_volume(&block)
    ::KubeDSL::DSL::AttachedVolume.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def azure_disk_volume_source(&block)
    ::KubeDSL::DSL::AzureDiskVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def azure_file_persistent_volume_source(&block)
    ::KubeDSL::DSL::AzureFilePersistentVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def azure_file_volume_source(&block)
    ::KubeDSL::DSL::AzureFileVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def binding(&block)
    ::KubeDSL::DSL::Binding.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def csi_persistent_volume_source(&block)
    ::KubeDSL::DSL::CSIPersistentVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def csi_volume_source(&block)
    ::KubeDSL::DSL::CSIVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def capabilities(&block)
    ::KubeDSL::DSL::Capabilities.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def ceph_fs_persistent_volume_source(&block)
    ::KubeDSL::DSL::CephFSPersistentVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def ceph_fs_volume_source(&block)
    ::KubeDSL::DSL::CephFSVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def cinder_persistent_volume_source(&block)
    ::KubeDSL::DSL::CinderPersistentVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def cinder_volume_source(&block)
    ::KubeDSL::DSL::CinderVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def client_ip_config(&block)
    ::KubeDSL::DSL::ClientIPConfig.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def component_condition(&block)
    ::KubeDSL::DSL::ComponentCondition.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def component_status(&block)
    ::KubeDSL::DSL::ComponentStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def component_status_list(&block)
    ::KubeDSL::DSL::ComponentStatusList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def config_map(&block)
    ::KubeDSL::DSL::ConfigMap.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def config_map_env_source(&block)
    ::KubeDSL::DSL::ConfigMapEnvSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def config_map_key_selector(&block)
    ::KubeDSL::DSL::ConfigMapKeySelector.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def config_map_list(&block)
    ::KubeDSL::DSL::ConfigMapList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def config_map_node_config_source(&block)
    ::KubeDSL::DSL::ConfigMapNodeConfigSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def config_map_projection(&block)
    ::KubeDSL::DSL::ConfigMapProjection.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def config_map_volume_source(&block)
    ::KubeDSL::DSL::ConfigMapVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def container(&block)
    ::KubeDSL::DSL::Container.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def container_image(&block)
    ::KubeDSL::DSL::ContainerImage.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def container_port(&block)
    ::KubeDSL::DSL::ContainerPort.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def container_state(&block)
    ::KubeDSL::DSL::ContainerState.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def container_state_running(&block)
    ::KubeDSL::DSL::ContainerStateRunning.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def container_state_terminated(&block)
    ::KubeDSL::DSL::ContainerStateTerminated.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def container_state_waiting(&block)
    ::KubeDSL::DSL::ContainerStateWaiting.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def container_status(&block)
    ::KubeDSL::DSL::ContainerStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def daemon_endpoint(&block)
    ::KubeDSL::DSL::DaemonEndpoint.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def downward_api_projection(&block)
    ::KubeDSL::DSL::DownwardAPIProjection.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def downward_api_volume_file(&block)
    ::KubeDSL::DSL::DownwardAPIVolumeFile.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def downward_api_volume_source(&block)
    ::KubeDSL::DSL::DownwardAPIVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def empty_dir_volume_source(&block)
    ::KubeDSL::DSL::EmptyDirVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def endpoint_address(&block)
    ::KubeDSL::DSL::EndpointAddress.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def endpoint_port(&block)
    ::KubeDSL::DSL::EndpointPort.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def endpoint_subset(&block)
    ::KubeDSL::DSL::EndpointSubset.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def endpoints(&block)
    ::KubeDSL::DSL::Endpoints.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def endpoints_list(&block)
    ::KubeDSL::DSL::EndpointsList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def env_from_source(&block)
    ::KubeDSL::DSL::EnvFromSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def env_var(&block)
    ::KubeDSL::DSL::EnvVar.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def env_var_source(&block)
    ::KubeDSL::DSL::EnvVarSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def ephemeral_container(&block)
    ::KubeDSL::DSL::EphemeralContainer.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def event(&block)
    ::KubeDSL::DSL::Event.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def event_list(&block)
    ::KubeDSL::DSL::EventList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def event_series(&block)
    ::KubeDSL::DSL::EventSeries.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def event_source(&block)
    ::KubeDSL::DSL::EventSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def exec_action(&block)
    ::KubeDSL::DSL::ExecAction.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def fc_volume_source(&block)
    ::KubeDSL::DSL::FCVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def flex_persistent_volume_source(&block)
    ::KubeDSL::DSL::FlexPersistentVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def flex_volume_source(&block)
    ::KubeDSL::DSL::FlexVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def flocker_volume_source(&block)
    ::KubeDSL::DSL::FlockerVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def gce_persistent_disk_volume_source(&block)
    ::KubeDSL::DSL::GCEPersistentDiskVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def git_repo_volume_source(&block)
    ::KubeDSL::DSL::GitRepoVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def glusterfs_persistent_volume_source(&block)
    ::KubeDSL::DSL::GlusterfsPersistentVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def glusterfs_volume_source(&block)
    ::KubeDSL::DSL::GlusterfsVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def http_get_action(&block)
    ::KubeDSL::DSL::HTTPGetAction.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def http_header(&block)
    ::KubeDSL::DSL::HTTPHeader.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def handler(&block)
    ::KubeDSL::DSL::Handler.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def host_alias(&block)
    ::KubeDSL::DSL::HostAlias.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def host_path_volume_source(&block)
    ::KubeDSL::DSL::HostPathVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def iscsi_persistent_volume_source(&block)
    ::KubeDSL::DSL::ISCSIPersistentVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def iscsi_volume_source(&block)
    ::KubeDSL::DSL::ISCSIVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def key_to_path(&block)
    ::KubeDSL::DSL::KeyToPath.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def lifecycle(&block)
    ::KubeDSL::DSL::Lifecycle.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def limit_range(&block)
    ::KubeDSL::DSL::LimitRange.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def limit_range_item(&block)
    ::KubeDSL::DSL::LimitRangeItem.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def limit_range_list(&block)
    ::KubeDSL::DSL::LimitRangeList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def limit_range_spec(&block)
    ::KubeDSL::DSL::LimitRangeSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def load_balancer_ingress(&block)
    ::KubeDSL::DSL::LoadBalancerIngress.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def load_balancer_status(&block)
    ::KubeDSL::DSL::LoadBalancerStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def local_object_reference(&block)
    ::KubeDSL::DSL::LocalObjectReference.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def local_volume_source(&block)
    ::KubeDSL::DSL::LocalVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def nfs_volume_source(&block)
    ::KubeDSL::DSL::NFSVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def namespace(&block)
    ::KubeDSL::DSL::Namespace.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def namespace_condition(&block)
    ::KubeDSL::DSL::NamespaceCondition.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def namespace_list(&block)
    ::KubeDSL::DSL::NamespaceList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def namespace_spec(&block)
    ::KubeDSL::DSL::NamespaceSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def namespace_status(&block)
    ::KubeDSL::DSL::NamespaceStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node(&block)
    ::KubeDSL::DSL::Node.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_address(&block)
    ::KubeDSL::DSL::NodeAddress.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_affinity(&block)
    ::KubeDSL::DSL::NodeAffinity.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_condition(&block)
    ::KubeDSL::DSL::NodeCondition.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_config_source(&block)
    ::KubeDSL::DSL::NodeConfigSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_config_status(&block)
    ::KubeDSL::DSL::NodeConfigStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_daemon_endpoints(&block)
    ::KubeDSL::DSL::NodeDaemonEndpoints.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_list(&block)
    ::KubeDSL::DSL::NodeList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_selector(&block)
    ::KubeDSL::DSL::NodeSelector.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_selector_requirement(&block)
    ::KubeDSL::DSL::NodeSelectorRequirement.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_selector_term(&block)
    ::KubeDSL::DSL::NodeSelectorTerm.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_spec(&block)
    ::KubeDSL::DSL::NodeSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_status(&block)
    ::KubeDSL::DSL::NodeStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def node_system_info(&block)
    ::KubeDSL::DSL::NodeSystemInfo.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def object_field_selector(&block)
    ::KubeDSL::DSL::ObjectFieldSelector.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def object_reference(&block)
    ::KubeDSL::DSL::ObjectReference.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def persistent_volume(&block)
    ::KubeDSL::DSL::PersistentVolume.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def persistent_volume_claim(&block)
    ::KubeDSL::DSL::PersistentVolumeClaim.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def persistent_volume_claim_condition(&block)
    ::KubeDSL::DSL::PersistentVolumeClaimCondition.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def persistent_volume_claim_list(&block)
    ::KubeDSL::DSL::PersistentVolumeClaimList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def persistent_volume_claim_spec(&block)
    ::KubeDSL::DSL::PersistentVolumeClaimSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def persistent_volume_claim_status(&block)
    ::KubeDSL::DSL::PersistentVolumeClaimStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def persistent_volume_claim_volume_source(&block)
    ::KubeDSL::DSL::PersistentVolumeClaimVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def persistent_volume_list(&block)
    ::KubeDSL::DSL::PersistentVolumeList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def persistent_volume_spec(&block)
    ::KubeDSL::DSL::PersistentVolumeSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def persistent_volume_status(&block)
    ::KubeDSL::DSL::PersistentVolumeStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def photon_persistent_disk_volume_source(&block)
    ::KubeDSL::DSL::PhotonPersistentDiskVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod(&block)
    ::KubeDSL::DSL::Pod.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_affinity(&block)
    ::KubeDSL::DSL::PodAffinity.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_affinity_term(&block)
    ::KubeDSL::DSL::PodAffinityTerm.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_anti_affinity(&block)
    ::KubeDSL::DSL::PodAntiAffinity.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_condition(&block)
    ::KubeDSL::DSL::PodCondition.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_dns_config(&block)
    ::KubeDSL::DSL::PodDNSConfig.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_dns_config_option(&block)
    ::KubeDSL::DSL::PodDNSConfigOption.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_ip(&block)
    ::KubeDSL::DSL::PodIP.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_list(&block)
    ::KubeDSL::DSL::PodList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_readiness_gate(&block)
    ::KubeDSL::DSL::PodReadinessGate.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_security_context(&block)
    ::KubeDSL::DSL::PodSecurityContext.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_spec(&block)
    ::KubeDSL::DSL::PodSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_status(&block)
    ::KubeDSL::DSL::PodStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_template(&block)
    ::KubeDSL::DSL::PodTemplate.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_template_list(&block)
    ::KubeDSL::DSL::PodTemplateList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def pod_template_spec(&block)
    ::KubeDSL::DSL::PodTemplateSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def portworx_volume_source(&block)
    ::KubeDSL::DSL::PortworxVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def preferred_scheduling_term(&block)
    ::KubeDSL::DSL::PreferredSchedulingTerm.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def probe(&block)
    ::KubeDSL::DSL::Probe.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def projected_volume_source(&block)
    ::KubeDSL::DSL::ProjectedVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def quobyte_volume_source(&block)
    ::KubeDSL::DSL::QuobyteVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def rbd_persistent_volume_source(&block)
    ::KubeDSL::DSL::RBDPersistentVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def rbd_volume_source(&block)
    ::KubeDSL::DSL::RBDVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def replication_controller(&block)
    ::KubeDSL::DSL::ReplicationController.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def replication_controller_condition(&block)
    ::KubeDSL::DSL::ReplicationControllerCondition.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def replication_controller_list(&block)
    ::KubeDSL::DSL::ReplicationControllerList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def replication_controller_spec(&block)
    ::KubeDSL::DSL::ReplicationControllerSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def replication_controller_status(&block)
    ::KubeDSL::DSL::ReplicationControllerStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def resource_field_selector(&block)
    ::KubeDSL::DSL::ResourceFieldSelector.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def resource_quota(&block)
    ::KubeDSL::DSL::ResourceQuota.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def resource_quota_list(&block)
    ::KubeDSL::DSL::ResourceQuotaList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def resource_quota_spec(&block)
    ::KubeDSL::DSL::ResourceQuotaSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def resource_quota_status(&block)
    ::KubeDSL::DSL::ResourceQuotaStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def resource_requirements(&block)
    ::KubeDSL::DSL::ResourceRequirements.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def se_linux_options(&block)
    ::KubeDSL::DSL::SELinuxOptions.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def scale_io_persistent_volume_source(&block)
    ::KubeDSL::DSL::ScaleIOPersistentVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def scale_io_volume_source(&block)
    ::KubeDSL::DSL::ScaleIOVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def scope_selector(&block)
    ::KubeDSL::DSL::ScopeSelector.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def scoped_resource_selector_requirement(&block)
    ::KubeDSL::DSL::ScopedResourceSelectorRequirement.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def secret(&block)
    ::KubeDSL::DSL::Secret.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def secret_env_source(&block)
    ::KubeDSL::DSL::SecretEnvSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def secret_key_selector(&block)
    ::KubeDSL::DSL::SecretKeySelector.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def secret_list(&block)
    ::KubeDSL::DSL::SecretList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def secret_projection(&block)
    ::KubeDSL::DSL::SecretProjection.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def secret_reference(&block)
    ::KubeDSL::DSL::SecretReference.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def secret_volume_source(&block)
    ::KubeDSL::DSL::SecretVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def security_context(&block)
    ::KubeDSL::DSL::SecurityContext.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def service(&block)
    ::KubeDSL::DSL::Service.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def service_account(&block)
    ::KubeDSL::DSL::ServiceAccount.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def service_account_list(&block)
    ::KubeDSL::DSL::ServiceAccountList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def service_account_token_projection(&block)
    ::KubeDSL::DSL::ServiceAccountTokenProjection.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def service_list(&block)
    ::KubeDSL::DSL::ServiceList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def service_port(&block)
    ::KubeDSL::DSL::ServicePort.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def service_spec(&block)
    ::KubeDSL::DSL::ServiceSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def service_status(&block)
    ::KubeDSL::DSL::ServiceStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def session_affinity_config(&block)
    ::KubeDSL::DSL::SessionAffinityConfig.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def storage_os_persistent_volume_source(&block)
    ::KubeDSL::DSL::StorageOSPersistentVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def storage_os_volume_source(&block)
    ::KubeDSL::DSL::StorageOSVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def sysctl(&block)
    ::KubeDSL::DSL::Sysctl.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def tcp_socket_action(&block)
    ::KubeDSL::DSL::TCPSocketAction.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def taint(&block)
    ::KubeDSL::DSL::Taint.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def toleration(&block)
    ::KubeDSL::DSL::Toleration.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def topology_selector_label_requirement(&block)
    ::KubeDSL::DSL::TopologySelectorLabelRequirement.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def topology_selector_term(&block)
    ::KubeDSL::DSL::TopologySelectorTerm.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def topology_spread_constraint(&block)
    ::KubeDSL::DSL::TopologySpreadConstraint.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def typed_local_object_reference(&block)
    ::KubeDSL::DSL::TypedLocalObjectReference.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def volume(&block)
    ::KubeDSL::DSL::Volume.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def volume_device(&block)
    ::KubeDSL::DSL::VolumeDevice.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def volume_mount(&block)
    ::KubeDSL::DSL::VolumeMount.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def volume_node_affinity(&block)
    ::KubeDSL::DSL::VolumeNodeAffinity.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def volume_projection(&block)
    ::KubeDSL::DSL::VolumeProjection.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def vsphere_virtual_disk_volume_source(&block)
    ::KubeDSL::DSL::VsphereVirtualDiskVolumeSource.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def weighted_pod_affinity_term(&block)
    ::KubeDSL::DSL::WeightedPodAffinityTerm.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def windows_security_context_options(&block)
    ::KubeDSL::DSL::WindowsSecurityContextOptions.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def quantity(&block)
    ::KubeDSL::DSL::Quantity.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def controller_revision(&block)
    ::KubeDSL::DSL::Apps::ControllerRevision.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def controller_revision_list(&block)
    ::KubeDSL::DSL::Apps::ControllerRevisionList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def daemon_set(&block)
    ::KubeDSL::DSL::Apps::DaemonSet.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def daemon_set_condition(&block)
    ::KubeDSL::DSL::Apps::DaemonSetCondition.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def daemon_set_list(&block)
    ::KubeDSL::DSL::Apps::DaemonSetList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def daemon_set_spec(&block)
    ::KubeDSL::DSL::Apps::DaemonSetSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def daemon_set_status(&block)
    ::KubeDSL::DSL::Apps::DaemonSetStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def daemon_set_update_strategy(&block)
    ::KubeDSL::DSL::Apps::DaemonSetUpdateStrategy.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def deployment(&block)
    ::KubeDSL::DSL::Apps::Deployment.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def deployment_condition(&block)
    ::KubeDSL::DSL::Apps::DeploymentCondition.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def deployment_list(&block)
    ::KubeDSL::DSL::Apps::DeploymentList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def deployment_spec(&block)
    ::KubeDSL::DSL::Apps::DeploymentSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def deployment_status(&block)
    ::KubeDSL::DSL::Apps::DeploymentStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def deployment_strategy(&block)
    ::KubeDSL::DSL::Apps::DeploymentStrategy.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def replica_set(&block)
    ::KubeDSL::DSL::Apps::ReplicaSet.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def replica_set_condition(&block)
    ::KubeDSL::DSL::Apps::ReplicaSetCondition.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def replica_set_list(&block)
    ::KubeDSL::DSL::Apps::ReplicaSetList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def replica_set_spec(&block)
    ::KubeDSL::DSL::Apps::ReplicaSetSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def replica_set_status(&block)
    ::KubeDSL::DSL::Apps::ReplicaSetStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def rolling_update_daemon_set(&block)
    ::KubeDSL::DSL::Apps::RollingUpdateDaemonSet.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def rolling_update_deployment(&block)
    ::KubeDSL::DSL::Apps::RollingUpdateDeployment.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def rolling_update_stateful_set_strategy(&block)
    ::KubeDSL::DSL::Apps::RollingUpdateStatefulSetStrategy.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def stateful_set(&block)
    ::KubeDSL::DSL::Apps::StatefulSet.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def stateful_set_condition(&block)
    ::KubeDSL::DSL::Apps::StatefulSetCondition.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def stateful_set_list(&block)
    ::KubeDSL::DSL::Apps::StatefulSetList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def stateful_set_spec(&block)
    ::KubeDSL::DSL::Apps::StatefulSetSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def stateful_set_status(&block)
    ::KubeDSL::DSL::Apps::StatefulSetStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def stateful_set_update_strategy(&block)
    ::KubeDSL::DSL::Apps::StatefulSetUpdateStrategy.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def deployment_rollback(&block)
    ::KubeDSL::DSL::Apps::DeploymentRollback.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def rollback_config(&block)
    ::KubeDSL::DSL::Apps::RollbackConfig.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def scale(&block)
    ::KubeDSL::DSL::Apps::Scale.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def scale_spec(&block)
    ::KubeDSL::DSL::Apps::ScaleSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def scale_status(&block)
    ::KubeDSL::DSL::Apps::ScaleStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def ip_block(&block)
    ::KubeDSL::DSL::Networking::IPBlock.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def network_policy(&block)
    ::KubeDSL::DSL::Networking::NetworkPolicy.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def network_policy_egress_rule(&block)
    ::KubeDSL::DSL::Networking::NetworkPolicyEgressRule.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def network_policy_ingress_rule(&block)
    ::KubeDSL::DSL::Networking::NetworkPolicyIngressRule.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def network_policy_list(&block)
    ::KubeDSL::DSL::Networking::NetworkPolicyList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def network_policy_peer(&block)
    ::KubeDSL::DSL::Networking::NetworkPolicyPeer.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def network_policy_port(&block)
    ::KubeDSL::DSL::Networking::NetworkPolicyPort.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def network_policy_spec(&block)
    ::KubeDSL::DSL::Networking::NetworkPolicySpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def http_ingress_path(&block)
    ::KubeDSL::DSL::Networking::HTTPIngressPath.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def http_ingress_rule_value(&block)
    ::KubeDSL::DSL::Networking::HTTPIngressRuleValue.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def ingress(&block)
    ::KubeDSL::DSL::Networking::Ingress.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def ingress_backend(&block)
    ::KubeDSL::DSL::Networking::IngressBackend.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def ingress_list(&block)
    ::KubeDSL::DSL::Networking::IngressList.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def ingress_rule(&block)
    ::KubeDSL::DSL::Networking::IngressRule.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def ingress_spec(&block)
    ::KubeDSL::DSL::Networking::IngressSpec.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def ingress_status(&block)
    ::KubeDSL::DSL::Networking::IngressStatus.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end

  def ingress_tls(&block)
    ::KubeDSL::DSL::Networking::IngressTLS.new.tap do |resource|
      resource.instance_eval(&block) if block
    end
  end
end
