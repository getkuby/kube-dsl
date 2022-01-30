# typed: strict

module KubeDSL::Entrypoint
  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Admissionregistration::V1::MutatingWebhook) }
  def mutating_webhook(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Admissionregistration::V1::MutatingWebhookConfiguration) }
  def mutating_webhook_configuration(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Admissionregistration::V1::MutatingWebhookConfigurationList) }
  def mutating_webhook_configuration_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations) }
  def rule_with_operations(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Admissionregistration::V1::ServiceReference) }
  def admissionregistration_v1_service_reference(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhook) }
  def validating_webhook(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhookConfiguration) }
  def validating_webhook_configuration(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhookConfigurationList) }
  def validating_webhook_configuration_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Admissionregistration::V1::WebhookClientConfig) }
  def admissionregistration_v1_webhook_client_config(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::ControllerRevision) }
  def controller_revision(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::ControllerRevisionList) }
  def controller_revision_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::DaemonSet) }
  def daemon_set(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::DaemonSetCondition) }
  def daemon_set_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::DaemonSetList) }
  def daemon_set_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::DaemonSetSpec) }
  def daemon_set_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::DaemonSetStatus) }
  def daemon_set_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::DaemonSetUpdateStrategy) }
  def daemon_set_update_strategy(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::Deployment) }
  def deployment(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::DeploymentCondition) }
  def deployment_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::DeploymentList) }
  def deployment_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::DeploymentSpec) }
  def deployment_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::DeploymentStatus) }
  def deployment_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::DeploymentStrategy) }
  def deployment_strategy(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::ReplicaSet) }
  def replica_set(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::ReplicaSetCondition) }
  def replica_set_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::ReplicaSetList) }
  def replica_set_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::ReplicaSetSpec) }
  def replica_set_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::ReplicaSetStatus) }
  def replica_set_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::RollingUpdateDaemonSet) }
  def rolling_update_daemon_set(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::RollingUpdateDeployment) }
  def rolling_update_deployment(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::RollingUpdateStatefulSetStrategy) }
  def rolling_update_stateful_set_strategy(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::StatefulSet) }
  def stateful_set(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::StatefulSetCondition) }
  def stateful_set_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::StatefulSetList) }
  def stateful_set_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::StatefulSetSpec) }
  def stateful_set_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::StatefulSetStatus) }
  def stateful_set_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apps::V1::StatefulSetUpdateStrategy) }
  def stateful_set_update_strategy(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authentication::V1::BoundObjectReference) }
  def bound_object_reference(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authentication::V1::TokenRequest) }
  def token_request(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authentication::V1::TokenRequestSpec) }
  def token_request_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authentication::V1::TokenRequestStatus) }
  def token_request_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authentication::V1::TokenReview) }
  def token_review(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authentication::V1::TokenReviewSpec) }
  def token_review_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authentication::V1::TokenReviewStatus) }
  def token_review_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authentication::V1::UserInfo) }
  def user_info(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::LocalSubjectAccessReview) }
  def local_subject_access_review(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::NonResourceAttributes) }
  def non_resource_attributes(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::NonResourceRule) }
  def non_resource_rule(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::ResourceAttributes) }
  def resource_attributes(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::ResourceRule) }
  def resource_rule(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::SelfSubjectAccessReview) }
  def self_subject_access_review(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::SelfSubjectAccessReviewSpec) }
  def self_subject_access_review_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::SelfSubjectRulesReview) }
  def self_subject_rules_review(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::SelfSubjectRulesReviewSpec) }
  def self_subject_rules_review_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::SubjectAccessReview) }
  def subject_access_review(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::SubjectAccessReviewSpec) }
  def subject_access_review_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::SubjectAccessReviewStatus) }
  def subject_access_review_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Authorization::V1::SubjectRulesReviewStatus) }
  def subject_rules_review_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Autoscaling::V1::CrossVersionObjectReference) }
  def cross_version_object_reference(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscaler) }
  def horizontal_pod_autoscaler(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerList) }
  def horizontal_pod_autoscaler_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerSpec) }
  def horizontal_pod_autoscaler_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerStatus) }
  def horizontal_pod_autoscaler_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Autoscaling::V1::Scale) }
  def scale(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Autoscaling::V1::ScaleSpec) }
  def scale_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Autoscaling::V1::ScaleStatus) }
  def scale_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Batch::V1::Job) }
  def job(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Batch::V1::JobCondition) }
  def job_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Batch::V1::JobList) }
  def job_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Batch::V1::JobSpec) }
  def job_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Batch::V1::JobStatus) }
  def job_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Coordination::V1::Lease) }
  def lease(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Coordination::V1::LeaseList) }
  def lease_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Coordination::V1::LeaseSpec) }
  def lease_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource) }
  def aws_elastic_block_store_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Affinity) }
  def affinity(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::AttachedVolume) }
  def attached_volume(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::AzureDiskVolumeSource) }
  def azure_disk_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::AzureFilePersistentVolumeSource) }
  def azure_file_persistent_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::AzureFileVolumeSource) }
  def azure_file_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Binding) }
  def binding(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::CSIPersistentVolumeSource) }
  def csi_persistent_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::CSIVolumeSource) }
  def csi_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Capabilities) }
  def capabilities(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::CephFSPersistentVolumeSource) }
  def ceph_fs_persistent_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::CephFSVolumeSource) }
  def ceph_fs_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::CinderPersistentVolumeSource) }
  def cinder_persistent_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::CinderVolumeSource) }
  def cinder_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ClientIPConfig) }
  def client_ip_config(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ComponentCondition) }
  def component_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ComponentStatus) }
  def component_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ComponentStatusList) }
  def component_status_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ConfigMap) }
  def config_map(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ConfigMapEnvSource) }
  def config_map_env_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ConfigMapKeySelector) }
  def config_map_key_selector(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ConfigMapList) }
  def config_map_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ConfigMapNodeConfigSource) }
  def config_map_node_config_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ConfigMapProjection) }
  def config_map_projection(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ConfigMapVolumeSource) }
  def config_map_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Container) }
  def container(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ContainerImage) }
  def container_image(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ContainerPort) }
  def container_port(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ContainerState) }
  def container_state(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ContainerStateRunning) }
  def container_state_running(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ContainerStateTerminated) }
  def container_state_terminated(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ContainerStateWaiting) }
  def container_state_waiting(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ContainerStatus) }
  def container_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::DaemonEndpoint) }
  def daemon_endpoint(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::DownwardAPIProjection) }
  def downward_api_projection(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::DownwardAPIVolumeFile) }
  def downward_api_volume_file(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::DownwardAPIVolumeSource) }
  def downward_api_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EmptyDirVolumeSource) }
  def empty_dir_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EndpointAddress) }
  def endpoint_address(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EndpointPort) }
  def endpoint_port(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EndpointSubset) }
  def endpoint_subset(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Endpoints) }
  def endpoints(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EndpointsList) }
  def endpoints_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EnvFromSource) }
  def env_from_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EnvVar) }
  def env_var(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EnvVarSource) }
  def env_var_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EphemeralContainer) }
  def ephemeral_container(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Event) }
  def event(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EventList) }
  def event_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EventSeries) }
  def event_series(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EventSource) }
  def event_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ExecAction) }
  def exec_action(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::FCVolumeSource) }
  def fc_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::FlexPersistentVolumeSource) }
  def flex_persistent_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::FlexVolumeSource) }
  def flex_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::FlockerVolumeSource) }
  def flocker_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource) }
  def gce_persistent_disk_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::GitRepoVolumeSource) }
  def git_repo_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::GlusterfsPersistentVolumeSource) }
  def glusterfs_persistent_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::GlusterfsVolumeSource) }
  def glusterfs_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::HTTPGetAction) }
  def http_get_action(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::HTTPHeader) }
  def http_header(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Handler) }
  def handler(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::HostAlias) }
  def host_alias(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::HostPathVolumeSource) }
  def host_path_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ISCSIPersistentVolumeSource) }
  def iscsi_persistent_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ISCSIVolumeSource) }
  def iscsi_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::KeyToPath) }
  def key_to_path(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Lifecycle) }
  def lifecycle(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::LimitRange) }
  def limit_range(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::LimitRangeItem) }
  def limit_range_item(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::LimitRangeList) }
  def limit_range_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::LimitRangeSpec) }
  def limit_range_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::LoadBalancerIngress) }
  def load_balancer_ingress(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::LoadBalancerStatus) }
  def load_balancer_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::LocalObjectReference) }
  def local_object_reference(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::LocalVolumeSource) }
  def local_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NFSVolumeSource) }
  def nfs_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Namespace) }
  def namespace(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NamespaceCondition) }
  def namespace_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NamespaceList) }
  def namespace_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NamespaceSpec) }
  def namespace_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NamespaceStatus) }
  def namespace_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Node) }
  def node(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeAddress) }
  def node_address(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeAffinity) }
  def node_affinity(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeCondition) }
  def node_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeConfigSource) }
  def node_config_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeConfigStatus) }
  def node_config_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeDaemonEndpoints) }
  def node_daemon_endpoints(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeList) }
  def node_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeSelector) }
  def node_selector(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeSelectorRequirement) }
  def node_selector_requirement(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeSelectorTerm) }
  def node_selector_term(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeSpec) }
  def node_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeStatus) }
  def node_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::NodeSystemInfo) }
  def node_system_info(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ObjectFieldSelector) }
  def object_field_selector(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ObjectReference) }
  def object_reference(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PersistentVolume) }
  def persistent_volume(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PersistentVolumeClaim) }
  def persistent_volume_claim(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PersistentVolumeClaimCondition) }
  def persistent_volume_claim_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PersistentVolumeClaimList) }
  def persistent_volume_claim_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PersistentVolumeClaimSpec) }
  def persistent_volume_claim_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PersistentVolumeClaimStatus) }
  def persistent_volume_claim_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PersistentVolumeClaimVolumeSource) }
  def persistent_volume_claim_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PersistentVolumeList) }
  def persistent_volume_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PersistentVolumeSpec) }
  def persistent_volume_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PersistentVolumeStatus) }
  def persistent_volume_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource) }
  def photon_persistent_disk_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Pod) }
  def pod(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodAffinity) }
  def pod_affinity(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodAffinityTerm) }
  def pod_affinity_term(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodAntiAffinity) }
  def pod_anti_affinity(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodCondition) }
  def pod_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodDNSConfig) }
  def pod_dns_config(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodDNSConfigOption) }
  def pod_dns_config_option(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodIP) }
  def pod_ip(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodList) }
  def pod_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodReadinessGate) }
  def pod_readiness_gate(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodSecurityContext) }
  def pod_security_context(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodSpec) }
  def pod_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodStatus) }
  def pod_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodTemplate) }
  def pod_template(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodTemplateList) }
  def pod_template_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PodTemplateSpec) }
  def pod_template_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PortworxVolumeSource) }
  def portworx_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PreferredSchedulingTerm) }
  def preferred_scheduling_term(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Probe) }
  def probe(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ProjectedVolumeSource) }
  def projected_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::QuobyteVolumeSource) }
  def quobyte_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::RBDPersistentVolumeSource) }
  def rbd_persistent_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::RBDVolumeSource) }
  def rbd_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ReplicationController) }
  def replication_controller(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ReplicationControllerCondition) }
  def replication_controller_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ReplicationControllerList) }
  def replication_controller_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ReplicationControllerSpec) }
  def replication_controller_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ReplicationControllerStatus) }
  def replication_controller_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ResourceFieldSelector) }
  def resource_field_selector(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ResourceQuota) }
  def resource_quota(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ResourceQuotaList) }
  def resource_quota_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ResourceQuotaSpec) }
  def resource_quota_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ResourceQuotaStatus) }
  def resource_quota_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ResourceRequirements) }
  def resource_requirements(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::SELinuxOptions) }
  def se_linux_options(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ScaleIOPersistentVolumeSource) }
  def scale_io_persistent_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ScaleIOVolumeSource) }
  def scale_io_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ScopeSelector) }
  def scope_selector(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ScopedResourceSelectorRequirement) }
  def scoped_resource_selector_requirement(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Secret) }
  def secret(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::SecretEnvSource) }
  def secret_env_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::SecretKeySelector) }
  def secret_key_selector(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::SecretList) }
  def secret_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::SecretProjection) }
  def secret_projection(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::SecretReference) }
  def secret_reference(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::SecretVolumeSource) }
  def secret_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::SecurityContext) }
  def security_context(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Service) }
  def service(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ServiceAccount) }
  def service_account(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ServiceAccountList) }
  def service_account_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ServiceAccountTokenProjection) }
  def service_account_token_projection(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ServiceList) }
  def service_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ServicePort) }
  def service_port(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ServiceSpec) }
  def service_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::ServiceStatus) }
  def service_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::SessionAffinityConfig) }
  def session_affinity_config(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::StorageOSPersistentVolumeSource) }
  def storage_os_persistent_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::StorageOSVolumeSource) }
  def storage_os_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Sysctl) }
  def sysctl(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::TCPSocketAction) }
  def tcp_socket_action(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Taint) }
  def taint(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Toleration) }
  def toleration(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::TopologySelectorLabelRequirement) }
  def topology_selector_label_requirement(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::TopologySelectorTerm) }
  def topology_selector_term(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::TopologySpreadConstraint) }
  def topology_spread_constraint(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::TypedLocalObjectReference) }
  def typed_local_object_reference(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Volume) }
  def volume(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::VolumeDevice) }
  def volume_device(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::VolumeMount) }
  def volume_mount(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::VolumeNodeAffinity) }
  def volume_node_affinity(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::VolumeProjection) }
  def volume_projection(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource) }
  def vsphere_virtual_disk_volume_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::WeightedPodAffinityTerm) }
  def weighted_pod_affinity_term(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::WindowsSecurityContextOptions) }
  def windows_security_context_options(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IPBlock) }
  def ip_block(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::NetworkPolicy) }
  def network_policy(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::NetworkPolicyEgressRule) }
  def network_policy_egress_rule(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::NetworkPolicyIngressRule) }
  def network_policy_ingress_rule(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::NetworkPolicyList) }
  def network_policy_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::NetworkPolicyPeer) }
  def network_policy_peer(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::NetworkPolicyPort) }
  def network_policy_port(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::NetworkPolicySpec) }
  def network_policy_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::AggregationRule) }
  def aggregation_rule(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::ClusterRole) }
  def cluster_role(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::ClusterRoleBinding) }
  def cluster_role_binding(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::ClusterRoleBindingList) }
  def cluster_role_binding_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::ClusterRoleList) }
  def cluster_role_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::PolicyRule) }
  def policy_rule(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::Role) }
  def role(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::RoleBinding) }
  def role_binding(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::RoleBindingList) }
  def role_binding_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::RoleList) }
  def role_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::RoleRef) }
  def role_ref(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Rbac::V1::Subject) }
  def subject(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Scheduling::V1::PriorityClass) }
  def priority_class(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Scheduling::V1::PriorityClassList) }
  def priority_class_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::CSINode) }
  def csi_node(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::CSINodeDriver) }
  def csi_node_driver(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::CSINodeList) }
  def csi_node_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::CSINodeSpec) }
  def csi_node_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::StorageClass) }
  def storage_class(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::StorageClassList) }
  def storage_class_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::VolumeAttachment) }
  def volume_attachment(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::VolumeAttachmentList) }
  def volume_attachment_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::VolumeAttachmentSource) }
  def volume_attachment_source(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::VolumeAttachmentSpec) }
  def volume_attachment_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::VolumeAttachmentStatus) }
  def volume_attachment_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::VolumeError) }
  def volume_error(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::VolumeNodeResources) }
  def volume_node_resources(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceColumnDefinition) }
  def custom_resource_column_definition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceConversion) }
  def custom_resource_conversion(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinition) }
  def custom_resource_definition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionCondition) }
  def custom_resource_definition_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionList) }
  def custom_resource_definition_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames) }
  def custom_resource_definition_names(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionSpec) }
  def custom_resource_definition_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionStatus) }
  def custom_resource_definition_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionVersion) }
  def custom_resource_definition_version(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresourceScale) }
  def custom_resource_subresource_scale(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresources) }
  def custom_resource_subresources(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::CustomResourceValidation) }
  def custom_resource_validation(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::ExternalDocumentation) }
  def external_documentation(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps) }
  def json_schema_props(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::ServiceReference) }
  def apiextensions_v1_service_reference(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::WebhookClientConfig) }
  def apiextensions_v1_webhook_client_config(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiextensions::V1::WebhookConversion) }
  def webhook_conversion(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::APIGroup) }
  def api_group(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::APIGroupList) }
  def api_group_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::APIResource) }
  def api_resource(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::APIResourceList) }
  def api_resource_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::APIVersions) }
  def api_versions(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::DeleteOptions) }
  def delete_options(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery) }
  def group_version_for_discovery(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::LabelSelector) }
  def label_selector(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::LabelSelectorRequirement) }
  def label_selector_requirement(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::ListMeta) }
  def list_meta(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::ManagedFieldsEntry) }
  def managed_fields_entry(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::ObjectMeta) }
  def object_meta(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::OwnerReference) }
  def owner_reference(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::Preconditions) }
  def preconditions(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR) }
  def server_address_by_client_cidr(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::Status) }
  def status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::StatusCause) }
  def status_cause(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::StatusDetails) }
  def status_details(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::WatchEvent) }
  def watch_event(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Pkg::Version::Info) }
  def info(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiregistration::V1::APIService) }
  def api_service(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiregistration::V1::APIServiceCondition) }
  def api_service_condition(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiregistration::V1::APIServiceList) }
  def api_service_list(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiregistration::V1::APIServiceSpec) }
  def api_service_spec(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiregistration::V1::APIServiceStatus) }
  def api_service_status(&block); end

  sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Apiregistration::V1::ServiceReference) }
  def apiregistration_v1_service_reference(&block); end
end