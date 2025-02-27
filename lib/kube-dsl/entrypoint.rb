# typed: strict

module KubeDSL
  module Entrypoint
    def mutating_webhook(&block)
      ::KubeDSL::DSL::Admissionregistration::V1::MutatingWebhook.new(&block)
    end

    def mutating_webhook_configuration(&block)
      ::KubeDSL::DSL::Admissionregistration::V1::MutatingWebhookConfiguration.new(&block)
    end

    def mutating_webhook_configuration_list(&block)
      ::KubeDSL::DSL::Admissionregistration::V1::MutatingWebhookConfigurationList.new(&block)
    end

    def rule_with_operations(&block)
      ::KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations.new(&block)
    end

    def admissionregistration_v1_service_reference(&block)
      ::KubeDSL::DSL::Admissionregistration::V1::ServiceReference.new(&block)
    end

    def validating_webhook(&block)
      ::KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhook.new(&block)
    end

    def validating_webhook_configuration(&block)
      ::KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhookConfiguration.new(&block)
    end

    def validating_webhook_configuration_list(&block)
      ::KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhookConfigurationList.new(&block)
    end

    def admissionregistration_v1_webhook_client_config(&block)
      ::KubeDSL::DSL::Admissionregistration::V1::WebhookClientConfig.new(&block)
    end

    def controller_revision(&block)
      ::KubeDSL::DSL::Apps::V1::ControllerRevision.new(&block)
    end

    def controller_revision_list(&block)
      ::KubeDSL::DSL::Apps::V1::ControllerRevisionList.new(&block)
    end

    def daemon_set(&block)
      ::KubeDSL::DSL::Apps::V1::DaemonSet.new(&block)
    end

    def daemon_set_condition(&block)
      ::KubeDSL::DSL::Apps::V1::DaemonSetCondition.new(&block)
    end

    def daemon_set_list(&block)
      ::KubeDSL::DSL::Apps::V1::DaemonSetList.new(&block)
    end

    def daemon_set_spec(&block)
      ::KubeDSL::DSL::Apps::V1::DaemonSetSpec.new(&block)
    end

    def daemon_set_status(&block)
      ::KubeDSL::DSL::Apps::V1::DaemonSetStatus.new(&block)
    end

    def daemon_set_update_strategy(&block)
      ::KubeDSL::DSL::Apps::V1::DaemonSetUpdateStrategy.new(&block)
    end

    def deployment(&block)
      ::KubeDSL::DSL::Apps::V1::Deployment.new(&block)
    end

    def deployment_condition(&block)
      ::KubeDSL::DSL::Apps::V1::DeploymentCondition.new(&block)
    end

    def deployment_list(&block)
      ::KubeDSL::DSL::Apps::V1::DeploymentList.new(&block)
    end

    def deployment_spec(&block)
      ::KubeDSL::DSL::Apps::V1::DeploymentSpec.new(&block)
    end

    def deployment_status(&block)
      ::KubeDSL::DSL::Apps::V1::DeploymentStatus.new(&block)
    end

    def deployment_strategy(&block)
      ::KubeDSL::DSL::Apps::V1::DeploymentStrategy.new(&block)
    end

    def replica_set(&block)
      ::KubeDSL::DSL::Apps::V1::ReplicaSet.new(&block)
    end

    def replica_set_condition(&block)
      ::KubeDSL::DSL::Apps::V1::ReplicaSetCondition.new(&block)
    end

    def replica_set_list(&block)
      ::KubeDSL::DSL::Apps::V1::ReplicaSetList.new(&block)
    end

    def replica_set_spec(&block)
      ::KubeDSL::DSL::Apps::V1::ReplicaSetSpec.new(&block)
    end

    def replica_set_status(&block)
      ::KubeDSL::DSL::Apps::V1::ReplicaSetStatus.new(&block)
    end

    def rolling_update_daemon_set(&block)
      ::KubeDSL::DSL::Apps::V1::RollingUpdateDaemonSet.new(&block)
    end

    def rolling_update_deployment(&block)
      ::KubeDSL::DSL::Apps::V1::RollingUpdateDeployment.new(&block)
    end

    def rolling_update_stateful_set_strategy(&block)
      ::KubeDSL::DSL::Apps::V1::RollingUpdateStatefulSetStrategy.new(&block)
    end

    def stateful_set(&block)
      ::KubeDSL::DSL::Apps::V1::StatefulSet.new(&block)
    end

    def stateful_set_condition(&block)
      ::KubeDSL::DSL::Apps::V1::StatefulSetCondition.new(&block)
    end

    def stateful_set_list(&block)
      ::KubeDSL::DSL::Apps::V1::StatefulSetList.new(&block)
    end

    def stateful_set_persistent_volume_claim_retention_policy(&block)
      ::KubeDSL::DSL::Apps::V1::StatefulSetPersistentVolumeClaimRetentionPolicy.new(&block)
    end

    def stateful_set_spec(&block)
      ::KubeDSL::DSL::Apps::V1::StatefulSetSpec.new(&block)
    end

    def stateful_set_status(&block)
      ::KubeDSL::DSL::Apps::V1::StatefulSetStatus.new(&block)
    end

    def stateful_set_update_strategy(&block)
      ::KubeDSL::DSL::Apps::V1::StatefulSetUpdateStrategy.new(&block)
    end

    def bound_object_reference(&block)
      ::KubeDSL::DSL::Authentication::V1::BoundObjectReference.new(&block)
    end

    def authentication_v1_token_request(&block)
      ::KubeDSL::DSL::Authentication::V1::TokenRequest.new(&block)
    end

    def token_request_spec(&block)
      ::KubeDSL::DSL::Authentication::V1::TokenRequestSpec.new(&block)
    end

    def token_request_status(&block)
      ::KubeDSL::DSL::Authentication::V1::TokenRequestStatus.new(&block)
    end

    def token_review(&block)
      ::KubeDSL::DSL::Authentication::V1::TokenReview.new(&block)
    end

    def token_review_spec(&block)
      ::KubeDSL::DSL::Authentication::V1::TokenReviewSpec.new(&block)
    end

    def token_review_status(&block)
      ::KubeDSL::DSL::Authentication::V1::TokenReviewStatus.new(&block)
    end

    def user_info(&block)
      ::KubeDSL::DSL::Authentication::V1::UserInfo.new(&block)
    end

    def local_subject_access_review(&block)
      ::KubeDSL::DSL::Authorization::V1::LocalSubjectAccessReview.new(&block)
    end

    def non_resource_attributes(&block)
      ::KubeDSL::DSL::Authorization::V1::NonResourceAttributes.new(&block)
    end

    def non_resource_rule(&block)
      ::KubeDSL::DSL::Authorization::V1::NonResourceRule.new(&block)
    end

    def resource_attributes(&block)
      ::KubeDSL::DSL::Authorization::V1::ResourceAttributes.new(&block)
    end

    def resource_rule(&block)
      ::KubeDSL::DSL::Authorization::V1::ResourceRule.new(&block)
    end

    def self_subject_access_review(&block)
      ::KubeDSL::DSL::Authorization::V1::SelfSubjectAccessReview.new(&block)
    end

    def self_subject_access_review_spec(&block)
      ::KubeDSL::DSL::Authorization::V1::SelfSubjectAccessReviewSpec.new(&block)
    end

    def self_subject_rules_review(&block)
      ::KubeDSL::DSL::Authorization::V1::SelfSubjectRulesReview.new(&block)
    end

    def self_subject_rules_review_spec(&block)
      ::KubeDSL::DSL::Authorization::V1::SelfSubjectRulesReviewSpec.new(&block)
    end

    def subject_access_review(&block)
      ::KubeDSL::DSL::Authorization::V1::SubjectAccessReview.new(&block)
    end

    def subject_access_review_spec(&block)
      ::KubeDSL::DSL::Authorization::V1::SubjectAccessReviewSpec.new(&block)
    end

    def subject_access_review_status(&block)
      ::KubeDSL::DSL::Authorization::V1::SubjectAccessReviewStatus.new(&block)
    end

    def subject_rules_review_status(&block)
      ::KubeDSL::DSL::Authorization::V1::SubjectRulesReviewStatus.new(&block)
    end

    def autoscaling_v1_cross_version_object_reference(&block)
      ::KubeDSL::DSL::Autoscaling::V1::CrossVersionObjectReference.new(&block)
    end

    def autoscaling_v1_horizontal_pod_autoscaler(&block)
      ::KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscaler.new(&block)
    end

    def autoscaling_v1_horizontal_pod_autoscaler_list(&block)
      ::KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerList.new(&block)
    end

    def autoscaling_v1_horizontal_pod_autoscaler_spec(&block)
      ::KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerSpec.new(&block)
    end

    def autoscaling_v1_horizontal_pod_autoscaler_status(&block)
      ::KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerStatus.new(&block)
    end

    def scale(&block)
      ::KubeDSL::DSL::Autoscaling::V1::Scale.new(&block)
    end

    def scale_spec(&block)
      ::KubeDSL::DSL::Autoscaling::V1::ScaleSpec.new(&block)
    end

    def scale_status(&block)
      ::KubeDSL::DSL::Autoscaling::V1::ScaleStatus.new(&block)
    end

    def container_resource_metric_source(&block)
      ::KubeDSL::DSL::Autoscaling::V2::ContainerResourceMetricSource.new(&block)
    end

    def container_resource_metric_status(&block)
      ::KubeDSL::DSL::Autoscaling::V2::ContainerResourceMetricStatus.new(&block)
    end

    def autoscaling_v2_cross_version_object_reference(&block)
      ::KubeDSL::DSL::Autoscaling::V2::CrossVersionObjectReference.new(&block)
    end

    def external_metric_source(&block)
      ::KubeDSL::DSL::Autoscaling::V2::ExternalMetricSource.new(&block)
    end

    def external_metric_status(&block)
      ::KubeDSL::DSL::Autoscaling::V2::ExternalMetricStatus.new(&block)
    end

    def hpa_scaling_policy(&block)
      ::KubeDSL::DSL::Autoscaling::V2::HPAScalingPolicy.new(&block)
    end

    def hpa_scaling_rules(&block)
      ::KubeDSL::DSL::Autoscaling::V2::HPAScalingRules.new(&block)
    end

    def autoscaling_v2_horizontal_pod_autoscaler(&block)
      ::KubeDSL::DSL::Autoscaling::V2::HorizontalPodAutoscaler.new(&block)
    end

    def horizontal_pod_autoscaler_behavior(&block)
      ::KubeDSL::DSL::Autoscaling::V2::HorizontalPodAutoscalerBehavior.new(&block)
    end

    def horizontal_pod_autoscaler_condition(&block)
      ::KubeDSL::DSL::Autoscaling::V2::HorizontalPodAutoscalerCondition.new(&block)
    end

    def autoscaling_v2_horizontal_pod_autoscaler_list(&block)
      ::KubeDSL::DSL::Autoscaling::V2::HorizontalPodAutoscalerList.new(&block)
    end

    def autoscaling_v2_horizontal_pod_autoscaler_spec(&block)
      ::KubeDSL::DSL::Autoscaling::V2::HorizontalPodAutoscalerSpec.new(&block)
    end

    def autoscaling_v2_horizontal_pod_autoscaler_status(&block)
      ::KubeDSL::DSL::Autoscaling::V2::HorizontalPodAutoscalerStatus.new(&block)
    end

    def metric_identifier(&block)
      ::KubeDSL::DSL::Autoscaling::V2::MetricIdentifier.new(&block)
    end

    def metric_spec(&block)
      ::KubeDSL::DSL::Autoscaling::V2::MetricSpec.new(&block)
    end

    def metric_status(&block)
      ::KubeDSL::DSL::Autoscaling::V2::MetricStatus.new(&block)
    end

    def metric_target(&block)
      ::KubeDSL::DSL::Autoscaling::V2::MetricTarget.new(&block)
    end

    def metric_value_status(&block)
      ::KubeDSL::DSL::Autoscaling::V2::MetricValueStatus.new(&block)
    end

    def object_metric_source(&block)
      ::KubeDSL::DSL::Autoscaling::V2::ObjectMetricSource.new(&block)
    end

    def object_metric_status(&block)
      ::KubeDSL::DSL::Autoscaling::V2::ObjectMetricStatus.new(&block)
    end

    def pods_metric_source(&block)
      ::KubeDSL::DSL::Autoscaling::V2::PodsMetricSource.new(&block)
    end

    def pods_metric_status(&block)
      ::KubeDSL::DSL::Autoscaling::V2::PodsMetricStatus.new(&block)
    end

    def resource_metric_source(&block)
      ::KubeDSL::DSL::Autoscaling::V2::ResourceMetricSource.new(&block)
    end

    def resource_metric_status(&block)
      ::KubeDSL::DSL::Autoscaling::V2::ResourceMetricStatus.new(&block)
    end

    def cron_job(&block)
      ::KubeDSL::DSL::Batch::V1::CronJob.new(&block)
    end

    def cron_job_list(&block)
      ::KubeDSL::DSL::Batch::V1::CronJobList.new(&block)
    end

    def cron_job_spec(&block)
      ::KubeDSL::DSL::Batch::V1::CronJobSpec.new(&block)
    end

    def cron_job_status(&block)
      ::KubeDSL::DSL::Batch::V1::CronJobStatus.new(&block)
    end

    def job(&block)
      ::KubeDSL::DSL::Batch::V1::Job.new(&block)
    end

    def job_condition(&block)
      ::KubeDSL::DSL::Batch::V1::JobCondition.new(&block)
    end

    def job_list(&block)
      ::KubeDSL::DSL::Batch::V1::JobList.new(&block)
    end

    def job_spec(&block)
      ::KubeDSL::DSL::Batch::V1::JobSpec.new(&block)
    end

    def job_status(&block)
      ::KubeDSL::DSL::Batch::V1::JobStatus.new(&block)
    end

    def job_template_spec(&block)
      ::KubeDSL::DSL::Batch::V1::JobTemplateSpec.new(&block)
    end

    def uncounted_terminated_pods(&block)
      ::KubeDSL::DSL::Batch::V1::UncountedTerminatedPods.new(&block)
    end

    def certificate_signing_request(&block)
      ::KubeDSL::DSL::Certificates::V1::CertificateSigningRequest.new(&block)
    end

    def certificate_signing_request_condition(&block)
      ::KubeDSL::DSL::Certificates::V1::CertificateSigningRequestCondition.new(&block)
    end

    def certificate_signing_request_list(&block)
      ::KubeDSL::DSL::Certificates::V1::CertificateSigningRequestList.new(&block)
    end

    def certificate_signing_request_spec(&block)
      ::KubeDSL::DSL::Certificates::V1::CertificateSigningRequestSpec.new(&block)
    end

    def certificate_signing_request_status(&block)
      ::KubeDSL::DSL::Certificates::V1::CertificateSigningRequestStatus.new(&block)
    end

    def lease(&block)
      ::KubeDSL::DSL::Coordination::V1::Lease.new(&block)
    end

    def lease_list(&block)
      ::KubeDSL::DSL::Coordination::V1::LeaseList.new(&block)
    end

    def lease_spec(&block)
      ::KubeDSL::DSL::Coordination::V1::LeaseSpec.new(&block)
    end

    def aws_elastic_block_store_volume_source(&block)
      ::KubeDSL::DSL::V1::AWSElasticBlockStoreVolumeSource.new(&block)
    end

    def affinity(&block)
      ::KubeDSL::DSL::V1::Affinity.new(&block)
    end

    def attached_volume(&block)
      ::KubeDSL::DSL::V1::AttachedVolume.new(&block)
    end

    def azure_disk_volume_source(&block)
      ::KubeDSL::DSL::V1::AzureDiskVolumeSource.new(&block)
    end

    def azure_file_persistent_volume_source(&block)
      ::KubeDSL::DSL::V1::AzureFilePersistentVolumeSource.new(&block)
    end

    def azure_file_volume_source(&block)
      ::KubeDSL::DSL::V1::AzureFileVolumeSource.new(&block)
    end

    def binding(&block)
      ::KubeDSL::DSL::V1::Binding.new(&block)
    end

    def csi_persistent_volume_source(&block)
      ::KubeDSL::DSL::V1::CSIPersistentVolumeSource.new(&block)
    end

    def csi_volume_source(&block)
      ::KubeDSL::DSL::V1::CSIVolumeSource.new(&block)
    end

    def capabilities(&block)
      ::KubeDSL::DSL::V1::Capabilities.new(&block)
    end

    def ceph_fs_persistent_volume_source(&block)
      ::KubeDSL::DSL::V1::CephFSPersistentVolumeSource.new(&block)
    end

    def ceph_fs_volume_source(&block)
      ::KubeDSL::DSL::V1::CephFSVolumeSource.new(&block)
    end

    def cinder_persistent_volume_source(&block)
      ::KubeDSL::DSL::V1::CinderPersistentVolumeSource.new(&block)
    end

    def cinder_volume_source(&block)
      ::KubeDSL::DSL::V1::CinderVolumeSource.new(&block)
    end

    def client_ip_config(&block)
      ::KubeDSL::DSL::V1::ClientIPConfig.new(&block)
    end

    def component_condition(&block)
      ::KubeDSL::DSL::V1::ComponentCondition.new(&block)
    end

    def component_status(&block)
      ::KubeDSL::DSL::V1::ComponentStatus.new(&block)
    end

    def component_status_list(&block)
      ::KubeDSL::DSL::V1::ComponentStatusList.new(&block)
    end

    def config_map(&block)
      ::KubeDSL::DSL::V1::ConfigMap.new(&block)
    end

    def config_map_env_source(&block)
      ::KubeDSL::DSL::V1::ConfigMapEnvSource.new(&block)
    end

    def config_map_key_selector(&block)
      ::KubeDSL::DSL::V1::ConfigMapKeySelector.new(&block)
    end

    def config_map_list(&block)
      ::KubeDSL::DSL::V1::ConfigMapList.new(&block)
    end

    def config_map_node_config_source(&block)
      ::KubeDSL::DSL::V1::ConfigMapNodeConfigSource.new(&block)
    end

    def config_map_projection(&block)
      ::KubeDSL::DSL::V1::ConfigMapProjection.new(&block)
    end

    def config_map_volume_source(&block)
      ::KubeDSL::DSL::V1::ConfigMapVolumeSource.new(&block)
    end

    def container(&block)
      ::KubeDSL::DSL::V1::Container.new(&block)
    end

    def container_image(&block)
      ::KubeDSL::DSL::V1::ContainerImage.new(&block)
    end

    def container_port(&block)
      ::KubeDSL::DSL::V1::ContainerPort.new(&block)
    end

    def container_state(&block)
      ::KubeDSL::DSL::V1::ContainerState.new(&block)
    end

    def container_state_running(&block)
      ::KubeDSL::DSL::V1::ContainerStateRunning.new(&block)
    end

    def container_state_terminated(&block)
      ::KubeDSL::DSL::V1::ContainerStateTerminated.new(&block)
    end

    def container_state_waiting(&block)
      ::KubeDSL::DSL::V1::ContainerStateWaiting.new(&block)
    end

    def container_status(&block)
      ::KubeDSL::DSL::V1::ContainerStatus.new(&block)
    end

    def daemon_endpoint(&block)
      ::KubeDSL::DSL::V1::DaemonEndpoint.new(&block)
    end

    def downward_api_projection(&block)
      ::KubeDSL::DSL::V1::DownwardAPIProjection.new(&block)
    end

    def downward_api_volume_file(&block)
      ::KubeDSL::DSL::V1::DownwardAPIVolumeFile.new(&block)
    end

    def downward_api_volume_source(&block)
      ::KubeDSL::DSL::V1::DownwardAPIVolumeSource.new(&block)
    end

    def empty_dir_volume_source(&block)
      ::KubeDSL::DSL::V1::EmptyDirVolumeSource.new(&block)
    end

    def endpoint_address(&block)
      ::KubeDSL::DSL::V1::EndpointAddress.new(&block)
    end

    def v1_endpoint_port(&block)
      ::KubeDSL::DSL::V1::EndpointPort.new(&block)
    end

    def endpoint_subset(&block)
      ::KubeDSL::DSL::V1::EndpointSubset.new(&block)
    end

    def endpoints(&block)
      ::KubeDSL::DSL::V1::Endpoints.new(&block)
    end

    def endpoints_list(&block)
      ::KubeDSL::DSL::V1::EndpointsList.new(&block)
    end

    def env_from_source(&block)
      ::KubeDSL::DSL::V1::EnvFromSource.new(&block)
    end

    def env_var(&block)
      ::KubeDSL::DSL::V1::EnvVar.new(&block)
    end

    def env_var_source(&block)
      ::KubeDSL::DSL::V1::EnvVarSource.new(&block)
    end

    def ephemeral_container(&block)
      ::KubeDSL::DSL::V1::EphemeralContainer.new(&block)
    end

    def ephemeral_volume_source(&block)
      ::KubeDSL::DSL::V1::EphemeralVolumeSource.new(&block)
    end

    def v1_event(&block)
      ::KubeDSL::DSL::V1::Event.new(&block)
    end

    def v1_event_list(&block)
      ::KubeDSL::DSL::V1::EventList.new(&block)
    end

    def v1_event_series(&block)
      ::KubeDSL::DSL::V1::EventSeries.new(&block)
    end

    def event_source(&block)
      ::KubeDSL::DSL::V1::EventSource.new(&block)
    end

    def exec_action(&block)
      ::KubeDSL::DSL::V1::ExecAction.new(&block)
    end

    def fc_volume_source(&block)
      ::KubeDSL::DSL::V1::FCVolumeSource.new(&block)
    end

    def flex_persistent_volume_source(&block)
      ::KubeDSL::DSL::V1::FlexPersistentVolumeSource.new(&block)
    end

    def flex_volume_source(&block)
      ::KubeDSL::DSL::V1::FlexVolumeSource.new(&block)
    end

    def flocker_volume_source(&block)
      ::KubeDSL::DSL::V1::FlockerVolumeSource.new(&block)
    end

    def gce_persistent_disk_volume_source(&block)
      ::KubeDSL::DSL::V1::GCEPersistentDiskVolumeSource.new(&block)
    end

    def grpc_action(&block)
      ::KubeDSL::DSL::V1::GRPCAction.new(&block)
    end

    def git_repo_volume_source(&block)
      ::KubeDSL::DSL::V1::GitRepoVolumeSource.new(&block)
    end

    def glusterfs_persistent_volume_source(&block)
      ::KubeDSL::DSL::V1::GlusterfsPersistentVolumeSource.new(&block)
    end

    def glusterfs_volume_source(&block)
      ::KubeDSL::DSL::V1::GlusterfsVolumeSource.new(&block)
    end

    def http_get_action(&block)
      ::KubeDSL::DSL::V1::HTTPGetAction.new(&block)
    end

    def http_header(&block)
      ::KubeDSL::DSL::V1::HTTPHeader.new(&block)
    end

    def host_alias(&block)
      ::KubeDSL::DSL::V1::HostAlias.new(&block)
    end

    def host_path_volume_source(&block)
      ::KubeDSL::DSL::V1::HostPathVolumeSource.new(&block)
    end

    def iscsi_persistent_volume_source(&block)
      ::KubeDSL::DSL::V1::ISCSIPersistentVolumeSource.new(&block)
    end

    def iscsi_volume_source(&block)
      ::KubeDSL::DSL::V1::ISCSIVolumeSource.new(&block)
    end

    def key_to_path(&block)
      ::KubeDSL::DSL::V1::KeyToPath.new(&block)
    end

    def lifecycle(&block)
      ::KubeDSL::DSL::V1::Lifecycle.new(&block)
    end

    def lifecycle_handler(&block)
      ::KubeDSL::DSL::V1::LifecycleHandler.new(&block)
    end

    def limit_range(&block)
      ::KubeDSL::DSL::V1::LimitRange.new(&block)
    end

    def limit_range_item(&block)
      ::KubeDSL::DSL::V1::LimitRangeItem.new(&block)
    end

    def limit_range_list(&block)
      ::KubeDSL::DSL::V1::LimitRangeList.new(&block)
    end

    def limit_range_spec(&block)
      ::KubeDSL::DSL::V1::LimitRangeSpec.new(&block)
    end

    def load_balancer_ingress(&block)
      ::KubeDSL::DSL::V1::LoadBalancerIngress.new(&block)
    end

    def load_balancer_status(&block)
      ::KubeDSL::DSL::V1::LoadBalancerStatus.new(&block)
    end

    def local_object_reference(&block)
      ::KubeDSL::DSL::V1::LocalObjectReference.new(&block)
    end

    def local_volume_source(&block)
      ::KubeDSL::DSL::V1::LocalVolumeSource.new(&block)
    end

    def nfs_volume_source(&block)
      ::KubeDSL::DSL::V1::NFSVolumeSource.new(&block)
    end

    def namespace(&block)
      ::KubeDSL::DSL::V1::Namespace.new(&block)
    end

    def namespace_condition(&block)
      ::KubeDSL::DSL::V1::NamespaceCondition.new(&block)
    end

    def namespace_list(&block)
      ::KubeDSL::DSL::V1::NamespaceList.new(&block)
    end

    def namespace_spec(&block)
      ::KubeDSL::DSL::V1::NamespaceSpec.new(&block)
    end

    def namespace_status(&block)
      ::KubeDSL::DSL::V1::NamespaceStatus.new(&block)
    end

    def node(&block)
      ::KubeDSL::DSL::V1::Node.new(&block)
    end

    def node_address(&block)
      ::KubeDSL::DSL::V1::NodeAddress.new(&block)
    end

    def node_affinity(&block)
      ::KubeDSL::DSL::V1::NodeAffinity.new(&block)
    end

    def node_condition(&block)
      ::KubeDSL::DSL::V1::NodeCondition.new(&block)
    end

    def node_config_source(&block)
      ::KubeDSL::DSL::V1::NodeConfigSource.new(&block)
    end

    def node_config_status(&block)
      ::KubeDSL::DSL::V1::NodeConfigStatus.new(&block)
    end

    def node_daemon_endpoints(&block)
      ::KubeDSL::DSL::V1::NodeDaemonEndpoints.new(&block)
    end

    def node_list(&block)
      ::KubeDSL::DSL::V1::NodeList.new(&block)
    end

    def node_selector(&block)
      ::KubeDSL::DSL::V1::NodeSelector.new(&block)
    end

    def node_selector_requirement(&block)
      ::KubeDSL::DSL::V1::NodeSelectorRequirement.new(&block)
    end

    def node_selector_term(&block)
      ::KubeDSL::DSL::V1::NodeSelectorTerm.new(&block)
    end

    def node_spec(&block)
      ::KubeDSL::DSL::V1::NodeSpec.new(&block)
    end

    def node_status(&block)
      ::KubeDSL::DSL::V1::NodeStatus.new(&block)
    end

    def node_system_info(&block)
      ::KubeDSL::DSL::V1::NodeSystemInfo.new(&block)
    end

    def object_field_selector(&block)
      ::KubeDSL::DSL::V1::ObjectFieldSelector.new(&block)
    end

    def object_reference(&block)
      ::KubeDSL::DSL::V1::ObjectReference.new(&block)
    end

    def persistent_volume(&block)
      ::KubeDSL::DSL::V1::PersistentVolume.new(&block)
    end

    def persistent_volume_claim(&block)
      ::KubeDSL::DSL::V1::PersistentVolumeClaim.new(&block)
    end

    def persistent_volume_claim_condition(&block)
      ::KubeDSL::DSL::V1::PersistentVolumeClaimCondition.new(&block)
    end

    def persistent_volume_claim_list(&block)
      ::KubeDSL::DSL::V1::PersistentVolumeClaimList.new(&block)
    end

    def persistent_volume_claim_spec(&block)
      ::KubeDSL::DSL::V1::PersistentVolumeClaimSpec.new(&block)
    end

    def persistent_volume_claim_status(&block)
      ::KubeDSL::DSL::V1::PersistentVolumeClaimStatus.new(&block)
    end

    def persistent_volume_claim_template(&block)
      ::KubeDSL::DSL::V1::PersistentVolumeClaimTemplate.new(&block)
    end

    def persistent_volume_claim_volume_source(&block)
      ::KubeDSL::DSL::V1::PersistentVolumeClaimVolumeSource.new(&block)
    end

    def persistent_volume_list(&block)
      ::KubeDSL::DSL::V1::PersistentVolumeList.new(&block)
    end

    def persistent_volume_spec(&block)
      ::KubeDSL::DSL::V1::PersistentVolumeSpec.new(&block)
    end

    def persistent_volume_status(&block)
      ::KubeDSL::DSL::V1::PersistentVolumeStatus.new(&block)
    end

    def photon_persistent_disk_volume_source(&block)
      ::KubeDSL::DSL::V1::PhotonPersistentDiskVolumeSource.new(&block)
    end

    def pod(&block)
      ::KubeDSL::DSL::V1::Pod.new(&block)
    end

    def pod_affinity(&block)
      ::KubeDSL::DSL::V1::PodAffinity.new(&block)
    end

    def pod_affinity_term(&block)
      ::KubeDSL::DSL::V1::PodAffinityTerm.new(&block)
    end

    def pod_anti_affinity(&block)
      ::KubeDSL::DSL::V1::PodAntiAffinity.new(&block)
    end

    def pod_condition(&block)
      ::KubeDSL::DSL::V1::PodCondition.new(&block)
    end

    def pod_dns_config(&block)
      ::KubeDSL::DSL::V1::PodDNSConfig.new(&block)
    end

    def pod_dns_config_option(&block)
      ::KubeDSL::DSL::V1::PodDNSConfigOption.new(&block)
    end

    def pod_ip(&block)
      ::KubeDSL::DSL::V1::PodIP.new(&block)
    end

    def pod_list(&block)
      ::KubeDSL::DSL::V1::PodList.new(&block)
    end

    def pod_os(&block)
      ::KubeDSL::DSL::V1::PodOS.new(&block)
    end

    def pod_readiness_gate(&block)
      ::KubeDSL::DSL::V1::PodReadinessGate.new(&block)
    end

    def pod_security_context(&block)
      ::KubeDSL::DSL::V1::PodSecurityContext.new(&block)
    end

    def pod_spec(&block)
      ::KubeDSL::DSL::V1::PodSpec.new(&block)
    end

    def pod_status(&block)
      ::KubeDSL::DSL::V1::PodStatus.new(&block)
    end

    def pod_template(&block)
      ::KubeDSL::DSL::V1::PodTemplate.new(&block)
    end

    def pod_template_list(&block)
      ::KubeDSL::DSL::V1::PodTemplateList.new(&block)
    end

    def pod_template_spec(&block)
      ::KubeDSL::DSL::V1::PodTemplateSpec.new(&block)
    end

    def port_status(&block)
      ::KubeDSL::DSL::V1::PortStatus.new(&block)
    end

    def portworx_volume_source(&block)
      ::KubeDSL::DSL::V1::PortworxVolumeSource.new(&block)
    end

    def preferred_scheduling_term(&block)
      ::KubeDSL::DSL::V1::PreferredSchedulingTerm.new(&block)
    end

    def probe(&block)
      ::KubeDSL::DSL::V1::Probe.new(&block)
    end

    def projected_volume_source(&block)
      ::KubeDSL::DSL::V1::ProjectedVolumeSource.new(&block)
    end

    def quobyte_volume_source(&block)
      ::KubeDSL::DSL::V1::QuobyteVolumeSource.new(&block)
    end

    def rbd_persistent_volume_source(&block)
      ::KubeDSL::DSL::V1::RBDPersistentVolumeSource.new(&block)
    end

    def rbd_volume_source(&block)
      ::KubeDSL::DSL::V1::RBDVolumeSource.new(&block)
    end

    def replication_controller(&block)
      ::KubeDSL::DSL::V1::ReplicationController.new(&block)
    end

    def replication_controller_condition(&block)
      ::KubeDSL::DSL::V1::ReplicationControllerCondition.new(&block)
    end

    def replication_controller_list(&block)
      ::KubeDSL::DSL::V1::ReplicationControllerList.new(&block)
    end

    def replication_controller_spec(&block)
      ::KubeDSL::DSL::V1::ReplicationControllerSpec.new(&block)
    end

    def replication_controller_status(&block)
      ::KubeDSL::DSL::V1::ReplicationControllerStatus.new(&block)
    end

    def resource_field_selector(&block)
      ::KubeDSL::DSL::V1::ResourceFieldSelector.new(&block)
    end

    def resource_quota(&block)
      ::KubeDSL::DSL::V1::ResourceQuota.new(&block)
    end

    def resource_quota_list(&block)
      ::KubeDSL::DSL::V1::ResourceQuotaList.new(&block)
    end

    def resource_quota_spec(&block)
      ::KubeDSL::DSL::V1::ResourceQuotaSpec.new(&block)
    end

    def resource_quota_status(&block)
      ::KubeDSL::DSL::V1::ResourceQuotaStatus.new(&block)
    end

    def resource_requirements(&block)
      ::KubeDSL::DSL::V1::ResourceRequirements.new(&block)
    end

    def se_linux_options(&block)
      ::KubeDSL::DSL::V1::SELinuxOptions.new(&block)
    end

    def scale_io_persistent_volume_source(&block)
      ::KubeDSL::DSL::V1::ScaleIOPersistentVolumeSource.new(&block)
    end

    def scale_io_volume_source(&block)
      ::KubeDSL::DSL::V1::ScaleIOVolumeSource.new(&block)
    end

    def scope_selector(&block)
      ::KubeDSL::DSL::V1::ScopeSelector.new(&block)
    end

    def scoped_resource_selector_requirement(&block)
      ::KubeDSL::DSL::V1::ScopedResourceSelectorRequirement.new(&block)
    end

    def seccomp_profile(&block)
      ::KubeDSL::DSL::V1::SeccompProfile.new(&block)
    end

    def secret(&block)
      ::KubeDSL::DSL::V1::Secret.new(&block)
    end

    def secret_env_source(&block)
      ::KubeDSL::DSL::V1::SecretEnvSource.new(&block)
    end

    def secret_key_selector(&block)
      ::KubeDSL::DSL::V1::SecretKeySelector.new(&block)
    end

    def secret_list(&block)
      ::KubeDSL::DSL::V1::SecretList.new(&block)
    end

    def secret_projection(&block)
      ::KubeDSL::DSL::V1::SecretProjection.new(&block)
    end

    def secret_reference(&block)
      ::KubeDSL::DSL::V1::SecretReference.new(&block)
    end

    def secret_volume_source(&block)
      ::KubeDSL::DSL::V1::SecretVolumeSource.new(&block)
    end

    def security_context(&block)
      ::KubeDSL::DSL::V1::SecurityContext.new(&block)
    end

    def service(&block)
      ::KubeDSL::DSL::V1::Service.new(&block)
    end

    def service_account(&block)
      ::KubeDSL::DSL::V1::ServiceAccount.new(&block)
    end

    def service_account_list(&block)
      ::KubeDSL::DSL::V1::ServiceAccountList.new(&block)
    end

    def service_account_token_projection(&block)
      ::KubeDSL::DSL::V1::ServiceAccountTokenProjection.new(&block)
    end

    def service_list(&block)
      ::KubeDSL::DSL::V1::ServiceList.new(&block)
    end

    def service_port(&block)
      ::KubeDSL::DSL::V1::ServicePort.new(&block)
    end

    def service_spec(&block)
      ::KubeDSL::DSL::V1::ServiceSpec.new(&block)
    end

    def service_status(&block)
      ::KubeDSL::DSL::V1::ServiceStatus.new(&block)
    end

    def session_affinity_config(&block)
      ::KubeDSL::DSL::V1::SessionAffinityConfig.new(&block)
    end

    def storage_os_persistent_volume_source(&block)
      ::KubeDSL::DSL::V1::StorageOSPersistentVolumeSource.new(&block)
    end

    def storage_os_volume_source(&block)
      ::KubeDSL::DSL::V1::StorageOSVolumeSource.new(&block)
    end

    def sysctl(&block)
      ::KubeDSL::DSL::V1::Sysctl.new(&block)
    end

    def tcp_socket_action(&block)
      ::KubeDSL::DSL::V1::TCPSocketAction.new(&block)
    end

    def taint(&block)
      ::KubeDSL::DSL::V1::Taint.new(&block)
    end

    def toleration(&block)
      ::KubeDSL::DSL::V1::Toleration.new(&block)
    end

    def topology_selector_label_requirement(&block)
      ::KubeDSL::DSL::V1::TopologySelectorLabelRequirement.new(&block)
    end

    def topology_selector_term(&block)
      ::KubeDSL::DSL::V1::TopologySelectorTerm.new(&block)
    end

    def topology_spread_constraint(&block)
      ::KubeDSL::DSL::V1::TopologySpreadConstraint.new(&block)
    end

    def typed_local_object_reference(&block)
      ::KubeDSL::DSL::V1::TypedLocalObjectReference.new(&block)
    end

    def volume(&block)
      ::KubeDSL::DSL::V1::Volume.new(&block)
    end

    def volume_device(&block)
      ::KubeDSL::DSL::V1::VolumeDevice.new(&block)
    end

    def volume_mount(&block)
      ::KubeDSL::DSL::V1::VolumeMount.new(&block)
    end

    def volume_node_affinity(&block)
      ::KubeDSL::DSL::V1::VolumeNodeAffinity.new(&block)
    end

    def volume_projection(&block)
      ::KubeDSL::DSL::V1::VolumeProjection.new(&block)
    end

    def vsphere_virtual_disk_volume_source(&block)
      ::KubeDSL::DSL::V1::VsphereVirtualDiskVolumeSource.new(&block)
    end

    def weighted_pod_affinity_term(&block)
      ::KubeDSL::DSL::V1::WeightedPodAffinityTerm.new(&block)
    end

    def windows_security_context_options(&block)
      ::KubeDSL::DSL::V1::WindowsSecurityContextOptions.new(&block)
    end

    def endpoint(&block)
      ::KubeDSL::DSL::Discovery::V1::Endpoint.new(&block)
    end

    def endpoint_conditions(&block)
      ::KubeDSL::DSL::Discovery::V1::EndpointConditions.new(&block)
    end

    def endpoint_hints(&block)
      ::KubeDSL::DSL::Discovery::V1::EndpointHints.new(&block)
    end

    def discovery_v1_endpoint_port(&block)
      ::KubeDSL::DSL::Discovery::V1::EndpointPort.new(&block)
    end

    def endpoint_slice(&block)
      ::KubeDSL::DSL::Discovery::V1::EndpointSlice.new(&block)
    end

    def endpoint_slice_list(&block)
      ::KubeDSL::DSL::Discovery::V1::EndpointSliceList.new(&block)
    end

    def for_zone(&block)
      ::KubeDSL::DSL::Discovery::V1::ForZone.new(&block)
    end

    def events_v1_event(&block)
      ::KubeDSL::DSL::Events::V1::Event.new(&block)
    end

    def events_v1_event_list(&block)
      ::KubeDSL::DSL::Events::V1::EventList.new(&block)
    end

    def events_v1_event_series(&block)
      ::KubeDSL::DSL::Events::V1::EventSeries.new(&block)
    end

    def http_ingress_path(&block)
      ::KubeDSL::DSL::Networking::V1::HTTPIngressPath.new(&block)
    end

    def http_ingress_rule_value(&block)
      ::KubeDSL::DSL::Networking::V1::HTTPIngressRuleValue.new(&block)
    end

    def ip_block(&block)
      ::KubeDSL::DSL::Networking::V1::IPBlock.new(&block)
    end

    def ingress(&block)
      ::KubeDSL::DSL::Networking::V1::Ingress.new(&block)
    end

    def ingress_backend(&block)
      ::KubeDSL::DSL::Networking::V1::IngressBackend.new(&block)
    end

    def ingress_class(&block)
      ::KubeDSL::DSL::Networking::V1::IngressClass.new(&block)
    end

    def ingress_class_list(&block)
      ::KubeDSL::DSL::Networking::V1::IngressClassList.new(&block)
    end

    def ingress_class_parameters_reference(&block)
      ::KubeDSL::DSL::Networking::V1::IngressClassParametersReference.new(&block)
    end

    def ingress_class_spec(&block)
      ::KubeDSL::DSL::Networking::V1::IngressClassSpec.new(&block)
    end

    def ingress_list(&block)
      ::KubeDSL::DSL::Networking::V1::IngressList.new(&block)
    end

    def ingress_rule(&block)
      ::KubeDSL::DSL::Networking::V1::IngressRule.new(&block)
    end

    def ingress_service_backend(&block)
      ::KubeDSL::DSL::Networking::V1::IngressServiceBackend.new(&block)
    end

    def ingress_spec(&block)
      ::KubeDSL::DSL::Networking::V1::IngressSpec.new(&block)
    end

    def ingress_status(&block)
      ::KubeDSL::DSL::Networking::V1::IngressStatus.new(&block)
    end

    def ingress_tls(&block)
      ::KubeDSL::DSL::Networking::V1::IngressTLS.new(&block)
    end

    def network_policy(&block)
      ::KubeDSL::DSL::Networking::V1::NetworkPolicy.new(&block)
    end

    def network_policy_egress_rule(&block)
      ::KubeDSL::DSL::Networking::V1::NetworkPolicyEgressRule.new(&block)
    end

    def network_policy_ingress_rule(&block)
      ::KubeDSL::DSL::Networking::V1::NetworkPolicyIngressRule.new(&block)
    end

    def network_policy_list(&block)
      ::KubeDSL::DSL::Networking::V1::NetworkPolicyList.new(&block)
    end

    def network_policy_peer(&block)
      ::KubeDSL::DSL::Networking::V1::NetworkPolicyPeer.new(&block)
    end

    def network_policy_port(&block)
      ::KubeDSL::DSL::Networking::V1::NetworkPolicyPort.new(&block)
    end

    def network_policy_spec(&block)
      ::KubeDSL::DSL::Networking::V1::NetworkPolicySpec.new(&block)
    end

    def service_backend_port(&block)
      ::KubeDSL::DSL::Networking::V1::ServiceBackendPort.new(&block)
    end

    def overhead(&block)
      ::KubeDSL::DSL::Node::V1::Overhead.new(&block)
    end

    def runtime_class(&block)
      ::KubeDSL::DSL::Node::V1::RuntimeClass.new(&block)
    end

    def runtime_class_list(&block)
      ::KubeDSL::DSL::Node::V1::RuntimeClassList.new(&block)
    end

    def scheduling(&block)
      ::KubeDSL::DSL::Node::V1::Scheduling.new(&block)
    end

    def eviction(&block)
      ::KubeDSL::DSL::Policy::V1::Eviction.new(&block)
    end

    def pod_disruption_budget(&block)
      ::KubeDSL::DSL::Policy::V1::PodDisruptionBudget.new(&block)
    end

    def pod_disruption_budget_list(&block)
      ::KubeDSL::DSL::Policy::V1::PodDisruptionBudgetList.new(&block)
    end

    def pod_disruption_budget_spec(&block)
      ::KubeDSL::DSL::Policy::V1::PodDisruptionBudgetSpec.new(&block)
    end

    def pod_disruption_budget_status(&block)
      ::KubeDSL::DSL::Policy::V1::PodDisruptionBudgetStatus.new(&block)
    end

    def aggregation_rule(&block)
      ::KubeDSL::DSL::Rbac::V1::AggregationRule.new(&block)
    end

    def cluster_role(&block)
      ::KubeDSL::DSL::Rbac::V1::ClusterRole.new(&block)
    end

    def cluster_role_binding(&block)
      ::KubeDSL::DSL::Rbac::V1::ClusterRoleBinding.new(&block)
    end

    def cluster_role_binding_list(&block)
      ::KubeDSL::DSL::Rbac::V1::ClusterRoleBindingList.new(&block)
    end

    def cluster_role_list(&block)
      ::KubeDSL::DSL::Rbac::V1::ClusterRoleList.new(&block)
    end

    def policy_rule(&block)
      ::KubeDSL::DSL::Rbac::V1::PolicyRule.new(&block)
    end

    def role(&block)
      ::KubeDSL::DSL::Rbac::V1::Role.new(&block)
    end

    def role_binding(&block)
      ::KubeDSL::DSL::Rbac::V1::RoleBinding.new(&block)
    end

    def role_binding_list(&block)
      ::KubeDSL::DSL::Rbac::V1::RoleBindingList.new(&block)
    end

    def role_list(&block)
      ::KubeDSL::DSL::Rbac::V1::RoleList.new(&block)
    end

    def role_ref(&block)
      ::KubeDSL::DSL::Rbac::V1::RoleRef.new(&block)
    end

    def subject(&block)
      ::KubeDSL::DSL::Rbac::V1::Subject.new(&block)
    end

    def priority_class(&block)
      ::KubeDSL::DSL::Scheduling::V1::PriorityClass.new(&block)
    end

    def priority_class_list(&block)
      ::KubeDSL::DSL::Scheduling::V1::PriorityClassList.new(&block)
    end

    def csi_driver(&block)
      ::KubeDSL::DSL::Storage::V1::CSIDriver.new(&block)
    end

    def csi_driver_list(&block)
      ::KubeDSL::DSL::Storage::V1::CSIDriverList.new(&block)
    end

    def csi_driver_spec(&block)
      ::KubeDSL::DSL::Storage::V1::CSIDriverSpec.new(&block)
    end

    def csi_node(&block)
      ::KubeDSL::DSL::Storage::V1::CSINode.new(&block)
    end

    def csi_node_driver(&block)
      ::KubeDSL::DSL::Storage::V1::CSINodeDriver.new(&block)
    end

    def csi_node_list(&block)
      ::KubeDSL::DSL::Storage::V1::CSINodeList.new(&block)
    end

    def csi_node_spec(&block)
      ::KubeDSL::DSL::Storage::V1::CSINodeSpec.new(&block)
    end

    def storage_class(&block)
      ::KubeDSL::DSL::Storage::V1::StorageClass.new(&block)
    end

    def storage_class_list(&block)
      ::KubeDSL::DSL::Storage::V1::StorageClassList.new(&block)
    end

    def storage_v1_token_request(&block)
      ::KubeDSL::DSL::Storage::V1::TokenRequest.new(&block)
    end

    def volume_attachment(&block)
      ::KubeDSL::DSL::Storage::V1::VolumeAttachment.new(&block)
    end

    def volume_attachment_list(&block)
      ::KubeDSL::DSL::Storage::V1::VolumeAttachmentList.new(&block)
    end

    def volume_attachment_source(&block)
      ::KubeDSL::DSL::Storage::V1::VolumeAttachmentSource.new(&block)
    end

    def volume_attachment_spec(&block)
      ::KubeDSL::DSL::Storage::V1::VolumeAttachmentSpec.new(&block)
    end

    def volume_attachment_status(&block)
      ::KubeDSL::DSL::Storage::V1::VolumeAttachmentStatus.new(&block)
    end

    def volume_error(&block)
      ::KubeDSL::DSL::Storage::V1::VolumeError.new(&block)
    end

    def volume_node_resources(&block)
      ::KubeDSL::DSL::Storage::V1::VolumeNodeResources.new(&block)
    end

    def custom_resource_column_definition(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceColumnDefinition.new(&block)
    end

    def custom_resource_conversion(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceConversion.new(&block)
    end

    def custom_resource_definition(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinition.new(&block)
    end

    def custom_resource_definition_condition(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionCondition.new(&block)
    end

    def custom_resource_definition_list(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionList.new(&block)
    end

    def custom_resource_definition_names(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames.new(&block)
    end

    def custom_resource_definition_spec(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionSpec.new(&block)
    end

    def custom_resource_definition_status(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionStatus.new(&block)
    end

    def custom_resource_definition_version(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionVersion.new(&block)
    end

    def custom_resource_subresource_scale(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresourceScale.new(&block)
    end

    def custom_resource_subresources(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresources.new(&block)
    end

    def custom_resource_validation(&block)
      ::KubeDSL::DSL::Apiextensions::V1::CustomResourceValidation.new(&block)
    end

    def external_documentation(&block)
      ::KubeDSL::DSL::Apiextensions::V1::ExternalDocumentation.new(&block)
    end

    def json_schema_props(&block)
      ::KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps.new(&block)
    end

    def apiextensions_v1_service_reference(&block)
      ::KubeDSL::DSL::Apiextensions::V1::ServiceReference.new(&block)
    end

    def validation_rule(&block)
      ::KubeDSL::DSL::Apiextensions::V1::ValidationRule.new(&block)
    end

    def apiextensions_v1_webhook_client_config(&block)
      ::KubeDSL::DSL::Apiextensions::V1::WebhookClientConfig.new(&block)
    end

    def webhook_conversion(&block)
      ::KubeDSL::DSL::Apiextensions::V1::WebhookConversion.new(&block)
    end

    def api_group(&block)
      ::KubeDSL::DSL::Meta::V1::APIGroup.new(&block)
    end

    def api_group_list(&block)
      ::KubeDSL::DSL::Meta::V1::APIGroupList.new(&block)
    end

    def api_resource(&block)
      ::KubeDSL::DSL::Meta::V1::APIResource.new(&block)
    end

    def api_resource_list(&block)
      ::KubeDSL::DSL::Meta::V1::APIResourceList.new(&block)
    end

    def api_versions(&block)
      ::KubeDSL::DSL::Meta::V1::APIVersions.new(&block)
    end

    def condition(&block)
      ::KubeDSL::DSL::Meta::V1::Condition.new(&block)
    end

    def delete_options(&block)
      ::KubeDSL::DSL::Meta::V1::DeleteOptions.new(&block)
    end

    def group_version_for_discovery(&block)
      ::KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery.new(&block)
    end

    def label_selector(&block)
      ::KubeDSL::DSL::Meta::V1::LabelSelector.new(&block)
    end

    def label_selector_requirement(&block)
      ::KubeDSL::DSL::Meta::V1::LabelSelectorRequirement.new(&block)
    end

    def list_meta(&block)
      ::KubeDSL::DSL::Meta::V1::ListMeta.new(&block)
    end

    def managed_fields_entry(&block)
      ::KubeDSL::DSL::Meta::V1::ManagedFieldsEntry.new(&block)
    end

    def object_meta(&block)
      ::KubeDSL::DSL::Meta::V1::ObjectMeta.new(&block)
    end

    def owner_reference(&block)
      ::KubeDSL::DSL::Meta::V1::OwnerReference.new(&block)
    end

    def preconditions(&block)
      ::KubeDSL::DSL::Meta::V1::Preconditions.new(&block)
    end

    def server_address_by_client_cidr(&block)
      ::KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR.new(&block)
    end

    def status(&block)
      ::KubeDSL::DSL::Meta::V1::Status.new(&block)
    end

    def status_cause(&block)
      ::KubeDSL::DSL::Meta::V1::StatusCause.new(&block)
    end

    def status_details(&block)
      ::KubeDSL::DSL::Meta::V1::StatusDetails.new(&block)
    end

    def watch_event(&block)
      ::KubeDSL::DSL::Meta::V1::WatchEvent.new(&block)
    end

    def info(&block)
      ::KubeDSL::DSL::Pkg::Version::Info.new(&block)
    end

    def api_service(&block)
      ::KubeDSL::DSL::Apiregistration::V1::APIService.new(&block)
    end

    def api_service_condition(&block)
      ::KubeDSL::DSL::Apiregistration::V1::APIServiceCondition.new(&block)
    end

    def api_service_list(&block)
      ::KubeDSL::DSL::Apiregistration::V1::APIServiceList.new(&block)
    end

    def api_service_spec(&block)
      ::KubeDSL::DSL::Apiregistration::V1::APIServiceSpec.new(&block)
    end

    def api_service_status(&block)
      ::KubeDSL::DSL::Apiregistration::V1::APIServiceStatus.new(&block)
    end

    def apiregistration_v1_service_reference(&block)
      ::KubeDSL::DSL::Apiregistration::V1::ServiceReference.new(&block)
    end
  end
end
