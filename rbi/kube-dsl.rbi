# typed: strong
module KubeDSL
  class DSLObject
    extend T::Sig
    extend ::KubeDSL::ValueFields
    extend ::KubeDSL::Validations

    sig { params(block: T.nilable(T.proc.void)).void }
    def initialize(&block); end

    sig { returns(::KubeDSL::Resource) }
    def to_resource; end

    sig { returns(T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped])) }
    def serialize; end
  end

  class Resource
    extend T::Sig

    sig { returns(T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped])) }
    attr_reader :contents

    sig { params(contents: T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped])).void }
    def initialize(contents); end

    sig { returns(T.nilable(T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped]))) }
    def serialize; end

    sig { returns(String) }
    def to_yaml; end

    sig { returns(Resource) }
    def to_resource; end

    sig { params(obj: T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped])).returns(T.nilable(T.any(String, T::Array[T.untyped], T::Hash[T.untyped, T.untyped]))) }
    def cleanup(obj); end
  end

  class ValidationError < StandardError
  end

  module Validations
    class ValidationErrors
      sig { returns(T.untyped) }
      attr_reader :messages

      sig { returns(T.untyped) }
      def initialize; end

      sig { params(field_name: T.untyped, msg: T.untyped).returns(T.untyped) }
      def add(field_name, msg); end

      sig { returns(T.untyped) }
      def empty?; end
    end

    class PresenceValidator
      sig { returns(T.untyped) }
      attr_reader :field_name

      sig { returns(T.untyped) }
      attr_reader :presence

      sig { params(field_name: T.untyped, presence: T.untyped).returns(T.untyped) }
      def initialize(field_name, presence); end

      sig { params(obj: T.untyped, errors: T.untyped, nesting: T.untyped).returns(T.untyped) }
      def validate(obj, errors, nesting); end

      sig { params(obj: T.untyped).returns(T.untyped) }
      def obj_empty?(obj); end
    end

    class ArrayValidator
      sig { returns(T.untyped) }
      attr_reader :field_name

      sig { returns(T.untyped) }
      attr_reader :kind_of

      sig { params(field_name: T.untyped, opts: T.untyped).returns(T.untyped) }
      def initialize(field_name, opts); end

      sig { params(obj: T.untyped, errors: T.untyped, nesting: T.untyped).returns(T.untyped) }
      def validate(obj, errors, nesting); end
    end

    class FormatValidator
      sig { returns(T.untyped) }
      attr_reader :format

      sig { params(format: T.untyped).returns(T.untyped) }
      def initialize(format); end

      sig { params(obj: T.untyped).returns(T.untyped) }
      def valid?(obj); end

      sig { returns(T.untyped) }
      def klasses; end
    end

    class FieldValidator
      sig { returns(T.untyped) }
      attr_reader :field_name

      sig { returns(T.untyped) }
      attr_reader :format_validator

      sig { params(field_name: T.untyped, options: T.untyped).returns(T.untyped) }
      def initialize(field_name, options = {}); end

      sig { params(obj: T.untyped, errors: T.untyped, nesting: T.untyped).returns(T.untyped) }
      def validate(obj, errors, nesting); end
    end

    class ObjectValidator
      sig { returns(T.untyped) }
      attr_reader :field_name

      sig { returns(T.untyped) }
      attr_reader :kind_of

      sig { params(field_name: T.untyped, opts: T.untyped).returns(T.untyped) }
      def initialize(field_name, opts); end

      sig { params(obj: T.untyped, errors: T.untyped, nesting: T.untyped).returns(T.untyped) }
      def validate(obj, errors, nesting); end
    end

    class KeyValueValidator
      sig { returns(T.untyped) }
      attr_reader :field_name

      sig { returns(T.untyped) }
      attr_reader :format_validator

      sig { params(field_name: T.untyped, options: T.untyped).returns(T.untyped) }
      def initialize(field_name, options = {}); end

      sig { params(obj: T.untyped, errors: T.untyped, nesting: T.untyped).returns(T.untyped) }
      def validate(obj, errors, nesting); end
    end

    class InclusionValidator
      sig { returns(T.untyped) }
      attr_reader :field_name

      sig { returns(T.untyped) }
      attr_reader :list

      sig { params(field_name: T.untyped, opts: T.untyped).returns(T.untyped) }
      def initialize(field_name, opts); end

      sig { params(obj: T.untyped, errors: T.untyped, nesting: T.untyped).returns(T.untyped) }
      def validate(obj, errors, nesting); end
    end

    module ClassMethods
      sig { params(field_name: T.untyped, options: T.untyped).returns(T.untyped) }
      def validates(field_name, options); end

      sig { returns(T.untyped) }
      def validators; end
    end

    module InstanceMethods
      sig { params(errors: T.untyped, nesting: T.untyped).returns(T.untyped) }
      def validate(errors = nil, nesting = []); end

      sig { returns(T.untyped) }
      def validate!; end

      sig { returns(T.untyped) }
      def valid?; end
    end

    sig { params(base: T.untyped).returns(T.untyped) }
    def self.extended(base); end
  end

  module ValueFields
    class ClassMismatchError < StandardError
    end

    module ClassMethods
      sig { params(fields: T.untyped).returns(T.untyped) }
      def value_fields(*fields); end

      sig { params(field: T.untyped, default: T.untyped).returns(T.untyped) }
      def value_field(field, default: nil); end

      sig { params(field: T.untyped, field_block: T.untyped).returns(T.untyped) }
      def object_field(field, &field_block); end

      sig { params(field: T.untyped, format: T.untyped).returns(T.untyped) }
      def key_value_field(field, format:); end

      sig { params(field: T.untyped, accessor: T.untyped, field_block: T.untyped).returns(T.untyped) }
      def array_field(field, accessor = nil, &field_block); end

      sig { returns(T.untyped) }
      def __fields__; end
    end

    module InstanceMethods
      sig { params(other: T.untyped, fields: T.untyped).returns(T.untyped) }
      def merge!(other, fields: nil); end

      sig { params(other: T.untyped, fields: T.untyped).returns(T.untyped) }
      def merge(other, fields); end
    end

    sig { params(base: T.untyped).returns(T.untyped) }
    def self.extended(base); end
  end

  module Entrypoint
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
    def authentication_v1_token_request(&block); end

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

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Batch::V1::CronJob) }
    def cron_job(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Batch::V1::CronJobList) }
    def cron_job_list(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Batch::V1::CronJobSpec) }
    def cron_job_spec(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Batch::V1::CronJobStatus) }
    def cron_job_status(&block); end

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

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Batch::V1::JobTemplateSpec) }
    def job_template_spec(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Batch::V1::UncountedTerminatedPods) }
    def uncounted_terminated_pods(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Certificates::V1::CertificateSigningRequest) }
    def certificate_signing_request(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Certificates::V1::CertificateSigningRequestCondition) }
    def certificate_signing_request_condition(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Certificates::V1::CertificateSigningRequestList) }
    def certificate_signing_request_list(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Certificates::V1::CertificateSigningRequestSpec) }
    def certificate_signing_request_spec(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Certificates::V1::CertificateSigningRequestStatus) }
    def certificate_signing_request_status(&block); end

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
    def v1_endpoint_port(&block); end

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

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EphemeralVolumeSource) }
    def ephemeral_volume_source(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::Event) }
    def v1_event(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EventList) }
    def v1_event_list(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::EventSeries) }
    def v1_event_series(&block); end

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

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PersistentVolumeClaimTemplate) }
    def persistent_volume_claim_template(&block); end

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

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::PortStatus) }
    def port_status(&block); end

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

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::V1::SeccompProfile) }
    def seccomp_profile(&block); end

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

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Discovery::V1::Endpoint) }
    def endpoint(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Discovery::V1::EndpointConditions) }
    def endpoint_conditions(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Discovery::V1::EndpointHints) }
    def endpoint_hints(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Discovery::V1::EndpointPort) }
    def discovery_v1_endpoint_port(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Discovery::V1::EndpointSlice) }
    def endpoint_slice(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Discovery::V1::EndpointSliceList) }
    def endpoint_slice_list(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Discovery::V1::ForZone) }
    def for_zone(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Events::V1::Event) }
    def events_v1_event(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Events::V1::EventList) }
    def events_v1_event_list(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Events::V1::EventSeries) }
    def events_v1_event_series(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::HTTPIngressPath) }
    def http_ingress_path(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::HTTPIngressRuleValue) }
    def http_ingress_rule_value(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IPBlock) }
    def ip_block(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::Ingress) }
    def ingress(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IngressBackend) }
    def ingress_backend(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IngressClass) }
    def ingress_class(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IngressClassList) }
    def ingress_class_list(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IngressClassParametersReference) }
    def ingress_class_parameters_reference(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IngressClassSpec) }
    def ingress_class_spec(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IngressList) }
    def ingress_list(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IngressRule) }
    def ingress_rule(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IngressServiceBackend) }
    def ingress_service_backend(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IngressSpec) }
    def ingress_spec(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IngressStatus) }
    def ingress_status(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::IngressTLS) }
    def ingress_tls(&block); end

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

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Networking::V1::ServiceBackendPort) }
    def service_backend_port(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Node::V1::Overhead) }
    def overhead(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Node::V1::RuntimeClass) }
    def runtime_class(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Node::V1::RuntimeClassList) }
    def runtime_class_list(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Node::V1::Scheduling) }
    def scheduling(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Policy::V1::Eviction) }
    def eviction(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Policy::V1::PodDisruptionBudget) }
    def pod_disruption_budget(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Policy::V1::PodDisruptionBudgetList) }
    def pod_disruption_budget_list(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Policy::V1::PodDisruptionBudgetSpec) }
    def pod_disruption_budget_spec(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Policy::V1::PodDisruptionBudgetStatus) }
    def pod_disruption_budget_status(&block); end

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

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::CSIDriver) }
    def csi_driver(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::CSIDriverList) }
    def csi_driver_list(&block); end

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::CSIDriverSpec) }
    def csi_driver_spec(&block); end

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

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Storage::V1::TokenRequest) }
    def storage_v1_token_request(&block); end

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

    sig { params(block: T.proc.void).returns(::KubeDSL::DSL::Meta::V1::Condition) }
    def condition(&block); end

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

  module DSL
    module Pkg
      module Version
        class Info < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def build_date(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def compiler(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def git_commit(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def git_tree_state(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def git_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def go_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def major(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def minor(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def platform(val = nil); end
        end
      end
    end

    module Admissionregistration
      module V1
        class MutatingWebhook < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def admission_review_versions(val = nil); end

          sig { returns(KubeDSL::DSL::Admissionregistration::V1::WebhookClientConfig) }
          def client_config; end

          sig { params(val: T.nilable(String)).returns(String) }
          def failure_policy(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def match_policy(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def namespace_selector; end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def object_selector; end

          sig { params(val: T.nilable(String)).returns(String) }
          def reinvocation_policy(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations))).returns(T::Array[KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations]) }
          def rules(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def side_effects(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def timeout_seconds(val = nil); end
        end

        class MutatingWebhookConfiguration < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Admissionregistration::V1::MutatingWebhook))).returns(T::Array[KubeDSL::DSL::Admissionregistration::V1::MutatingWebhook]) }
          def webhooks(elem_name = nil, &block); end
        end

        class MutatingWebhookConfigurationList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Admissionregistration::V1::MutatingWebhookConfiguration))).returns(T::Array[KubeDSL::DSL::Admissionregistration::V1::MutatingWebhookConfiguration]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class RuleWithOperations < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_groups(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_versions(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def operations(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def resources(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def scope(val = nil); end
        end

        class ServiceReference < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def path(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def port(val = nil); end
        end

        class ValidatingWebhook < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def admission_review_versions(val = nil); end

          sig { returns(KubeDSL::DSL::Admissionregistration::V1::WebhookClientConfig) }
          def client_config; end

          sig { params(val: T.nilable(String)).returns(String) }
          def failure_policy(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def match_policy(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def namespace_selector; end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def object_selector; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations))).returns(T::Array[KubeDSL::DSL::Admissionregistration::V1::RuleWithOperations]) }
          def rules(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def side_effects(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def timeout_seconds(val = nil); end
        end

        class ValidatingWebhookConfiguration < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhook))).returns(T::Array[KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhook]) }
          def webhooks(elem_name = nil, &block); end
        end

        class ValidatingWebhookConfigurationList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhookConfiguration))).returns(T::Array[KubeDSL::DSL::Admissionregistration::V1::ValidatingWebhookConfiguration]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class WebhookClientConfig < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def ca_bundle(val = nil); end

          sig { returns(KubeDSL::DSL::Admissionregistration::V1::ServiceReference) }
          def service; end

          sig { params(val: T.nilable(String)).returns(String) }
          def url(val = nil); end
        end
      end
    end

    module Apiextensions
      module V1
        class CustomResourceColumnDefinition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def description(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def format(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def json_path(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def priority(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class CustomResourceConversion < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def strategy(val = nil); end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::WebhookConversion) }
          def webhook; end
        end

        class CustomResourceDefinition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionStatus) }
          def status; end
        end

        class CustomResourceDefinitionCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class CustomResourceDefinitionList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinition))).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinition]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class CustomResourceDefinitionNames < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def categories(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def list_kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def plural(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def short_names(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def singular(val = nil); end
        end

        class CustomResourceDefinitionSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceConversion) }
          def conversion; end

          sig { params(val: T.nilable(String)).returns(String) }
          def group(val = nil); end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames) }
          def names; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def preserve_unknown_fields(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def scope(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionVersion))).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionVersion]) }
          def versions(elem_name = nil, &block); end
        end

        class CustomResourceDefinitionStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionNames) }
          def accepted_names; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionCondition))).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::CustomResourceDefinitionCondition]) }
          def conditions(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def stored_versions(val = nil); end
        end

        class CustomResourceDefinitionVersion < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceColumnDefinition))).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::CustomResourceColumnDefinition]) }
          def additional_printer_columns(elem_name = nil, &block); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def deprecated(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def deprecation_warning(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceValidation) }
          def schema; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def served(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def storage(val = nil); end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresources) }
          def subresources; end
        end

        class CustomResourceSubresourceScale < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def label_selector_path(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def spec_replicas_path(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status_replicas_path(val = nil); end
        end

        class CustomResourceSubresources < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::CustomResourceSubresourceScale) }
          def scale; end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end
        end

        class CustomResourceValidation < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps) }
          def open_apiv3_schema; end
        end

        class ExternalDocumentation < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def description(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def url(val = nil); end
        end

        class JSON < ::KubeDSL::DSLObject
          JSONType = T.type_alias { T.any(
        T::Array[T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped])],
        T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
      ) }

          sig { params(block: T.nilable(T.proc.void)).void }
          def initialize(&block); end

          sig { returns(JSONType) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(JSONType)).returns(JSONType) }
          def value(val = nil); end
        end

        class JSONSchemaProps < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def additional_items(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def additional_properties(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps))).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps]) }
          def all_ofs(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps))).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps]) }
          def any_ofs(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def default(val = nil); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def definitions(&block); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def dependencies(&block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def description(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::JSON))).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::JSON]) }
          def enums(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def example(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def exclusive_maximum(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def exclusive_minimum(val = nil); end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::ExternalDocumentation) }
          def external_docs; end

          sig { params(val: T.nilable(String)).returns(String) }
          def format(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def id(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def items(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max_items(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max_length(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max_properties(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def maximum(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_items(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_length(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_properties(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def minimum(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def multiple_of(val = nil); end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps) }
          def not_field; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def nullable(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps))).returns(T::Array[KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps]) }
          def one_ofs(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def pattern(val = nil); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def pattern_properties(&block); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def properties(&block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def required(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def title(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def unique_items(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def x_kubernetes_embedded_resource(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def x_kubernetes_int_or_string(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def x_kubernetes_list_map_keys(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def x_kubernetes_list_type(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def x_kubernetes_map_type(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def x_kubernetes_preserve_unknown_fields(val = nil); end
        end

        class ServiceReference < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def path(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def port(val = nil); end
        end

        class WebhookClientConfig < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def ca_bundle(val = nil); end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::ServiceReference) }
          def service; end

          sig { params(val: T.nilable(String)).returns(String) }
          def url(val = nil); end
        end

        class WebhookConversion < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Apiextensions::V1::WebhookClientConfig) }
          def client_config; end

          sig { params(val: T.nilable(String)).returns(String) }
          def conversion_review_versions(val = nil); end
        end
      end
    end

    module Apiregistration
      module V1
        class APIService < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Apiregistration::V1::APIServiceSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Apiregistration::V1::APIServiceStatus) }
          def status; end
        end

        class APIServiceCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class APIServiceList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiregistration::V1::APIService))).returns(T::Array[KubeDSL::DSL::Apiregistration::V1::APIService]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class APIServiceSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def ca_bundle(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def group(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def group_priority_minimum(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def insecure_skip_tls_verify(val = nil); end

          sig { returns(KubeDSL::DSL::Apiregistration::V1::ServiceReference) }
          def service; end

          sig { params(val: T.nilable(String)).returns(String) }
          def version(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def version_priority(val = nil); end
        end

        class APIServiceStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiregistration::V1::APIServiceCondition))).returns(T::Array[KubeDSL::DSL::Apiregistration::V1::APIServiceCondition]) }
          def conditions(elem_name = nil, &block); end
        end

        class ServiceReference < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def port(val = nil); end
        end
      end
    end

    module Apiserverinternal
      module V1alpha1
        class ServerStorageVersion < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_server_id(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def decodable_versions(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def encoding_version(val = nil); end
        end

        class StorageVersion < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(val: T.nilable(String)).returns(String) }
          def spec(val = nil); end

          sig { returns(KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionStatus) }
          def status; end
        end

        class StorageVersionCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class StorageVersionList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersion))).returns(T::Array[KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersion]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class StorageVersionStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def common_encoding_version(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionCondition))).returns(T::Array[KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionCondition]) }
          def conditions(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apiserverinternal::V1alpha1::ServerStorageVersion))).returns(T::Array[KubeDSL::DSL::Apiserverinternal::V1alpha1::ServerStorageVersion]) }
          def storage_versions(elem_name = nil, &block); end
        end
      end
    end

    module Apps
      module V1
        class ControllerRevision < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def data(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def revision(val = nil); end
        end

        class ControllerRevisionList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::ControllerRevision))).returns(T::Array[KubeDSL::DSL::Apps::V1::ControllerRevision]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class DaemonSet < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Apps::V1::DaemonSetSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Apps::V1::DaemonSetStatus) }
          def status; end
        end

        class DaemonSetCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class DaemonSetList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::DaemonSet))).returns(T::Array[KubeDSL::DSL::Apps::V1::DaemonSet]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class DaemonSetSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_ready_seconds(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def revision_history_limit(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end

          sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
          def template; end

          sig { returns(KubeDSL::DSL::Apps::V1::DaemonSetUpdateStrategy) }
          def update_strategy; end
        end

        class DaemonSetStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def collision_count(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::DaemonSetCondition))).returns(T::Array[KubeDSL::DSL::Apps::V1::DaemonSetCondition]) }
          def conditions(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_number_scheduled(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def desired_number_scheduled(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_available(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_misscheduled(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_ready(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number_unavailable(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def updated_number_scheduled(val = nil); end
        end

        class DaemonSetUpdateStrategy < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Apps::V1::RollingUpdateDaemonSet) }
          def rolling_update; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class Deployment < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Apps::V1::DeploymentSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Apps::V1::DeploymentStatus) }
          def status; end
        end

        class DeploymentCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_update_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class DeploymentList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::Deployment))).returns(T::Array[KubeDSL::DSL::Apps::V1::Deployment]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class DeploymentSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_ready_seconds(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def paused(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def progress_deadline_seconds(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def revision_history_limit(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end

          sig { returns(KubeDSL::DSL::Apps::V1::DeploymentStrategy) }
          def strategy; end

          sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
          def template; end
        end

        class DeploymentStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def available_replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def collision_count(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::DeploymentCondition))).returns(T::Array[KubeDSL::DSL::Apps::V1::DeploymentCondition]) }
          def conditions(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def ready_replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def unavailable_replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def updated_replicas(val = nil); end
        end

        class DeploymentStrategy < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Apps::V1::RollingUpdateDeployment) }
          def rolling_update; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class ReplicaSet < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Apps::V1::ReplicaSetSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Apps::V1::ReplicaSetStatus) }
          def status; end
        end

        class ReplicaSetCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class ReplicaSetList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::ReplicaSet))).returns(T::Array[KubeDSL::DSL::Apps::V1::ReplicaSet]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class ReplicaSetSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_ready_seconds(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def replicas(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end

          sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
          def template; end
        end

        class ReplicaSetStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def available_replicas(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::ReplicaSetCondition))).returns(T::Array[KubeDSL::DSL::Apps::V1::ReplicaSetCondition]) }
          def conditions(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def fully_labeled_replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def ready_replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def replicas(val = nil); end
        end

        class RollingUpdateDaemonSet < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def max_surge(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def max_unavailable(val = nil); end
        end

        class RollingUpdateDeployment < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def max_surge(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def max_unavailable(val = nil); end
        end

        class RollingUpdateStatefulSetStrategy < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def partition(val = nil); end
        end

        class StatefulSet < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Apps::V1::StatefulSetSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Apps::V1::StatefulSetStatus) }
          def status; end
        end

        class StatefulSetCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class StatefulSetList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::StatefulSet))).returns(T::Array[KubeDSL::DSL::Apps::V1::StatefulSet]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class StatefulSetSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_ready_seconds(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def pod_management_policy(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def revision_history_limit(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end

          sig { params(val: T.nilable(String)).returns(String) }
          def service_name(val = nil); end

          sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
          def template; end

          sig { returns(KubeDSL::DSL::Apps::V1::StatefulSetUpdateStrategy) }
          def update_strategy; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PersistentVolumeClaim))).returns(T::Array[KubeDSL::DSL::V1::PersistentVolumeClaim]) }
          def volume_claim_templates(elem_name = nil, &block); end
        end

        class StatefulSetStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def available_replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def collision_count(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Apps::V1::StatefulSetCondition))).returns(T::Array[KubeDSL::DSL::Apps::V1::StatefulSetCondition]) }
          def conditions(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_replicas(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def current_revision(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def ready_replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def replicas(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def update_revision(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def updated_replicas(val = nil); end
        end

        class StatefulSetUpdateStrategy < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Apps::V1::RollingUpdateStatefulSetStrategy) }
          def rolling_update; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end
      end
    end

    module Authentication
      module V1
        class BoundObjectReference < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def uid(val = nil); end
        end

        class TokenRequest < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Authentication::V1::TokenRequestSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Authentication::V1::TokenRequestStatus) }
          def status; end
        end

        class TokenRequestSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def audiences(val = nil); end

          sig { returns(KubeDSL::DSL::Authentication::V1::BoundObjectReference) }
          def bound_object_ref; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def expiration_seconds(val = nil); end
        end

        class TokenRequestStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def expiration_timestamp(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def token(val = nil); end
        end

        class TokenReview < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Authentication::V1::TokenReviewSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Authentication::V1::TokenReviewStatus) }
          def status; end
        end

        class TokenReviewSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def audiences(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def token(val = nil); end
        end

        class TokenReviewStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def audiences(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def authenticated(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def error(val = nil); end

          sig { returns(KubeDSL::DSL::Authentication::V1::UserInfo) }
          def user; end
        end

        class UserInfo < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def extra(&block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def groups(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def uid(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def username(val = nil); end
        end
      end
    end

    module Authorization
      module V1
        class LocalSubjectAccessReview < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Authorization::V1::SubjectAccessReviewSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Authorization::V1::SubjectAccessReviewStatus) }
          def status; end
        end

        class NonResourceAttributes < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def path(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def verb(val = nil); end
        end

        class NonResourceRule < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def non_resource_ur_ls(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def verbs(val = nil); end
        end

        class ResourceAttributes < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def group(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def resource(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def subresource(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def verb(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def version(val = nil); end
        end

        class ResourceRule < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_groups(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def resource_names(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def resources(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def verbs(val = nil); end
        end

        class SelfSubjectAccessReview < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Authorization::V1::SelfSubjectAccessReviewSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Authorization::V1::SubjectAccessReviewStatus) }
          def status; end
        end

        class SelfSubjectAccessReviewSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Authorization::V1::NonResourceAttributes) }
          def non_resource_attributes; end

          sig { returns(KubeDSL::DSL::Authorization::V1::ResourceAttributes) }
          def resource_attributes; end
        end

        class SelfSubjectRulesReview < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Authorization::V1::SelfSubjectRulesReviewSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Authorization::V1::SubjectRulesReviewStatus) }
          def status; end
        end

        class SelfSubjectRulesReviewSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end
        end

        class SubjectAccessReview < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Authorization::V1::SubjectAccessReviewSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Authorization::V1::SubjectAccessReviewStatus) }
          def status; end
        end

        class SubjectAccessReviewSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def extra(&block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def groups(val = nil); end

          sig { returns(KubeDSL::DSL::Authorization::V1::NonResourceAttributes) }
          def non_resource_attributes; end

          sig { returns(KubeDSL::DSL::Authorization::V1::ResourceAttributes) }
          def resource_attributes; end

          sig { params(val: T.nilable(String)).returns(String) }
          def uid(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def user(val = nil); end
        end

        class SubjectAccessReviewStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def allowed(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def denied(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def evaluation_error(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end
        end

        class SubjectRulesReviewStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def evaluation_error(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def incomplete(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Authorization::V1::NonResourceRule))).returns(T::Array[KubeDSL::DSL::Authorization::V1::NonResourceRule]) }
          def non_resource_rules(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Authorization::V1::ResourceRule))).returns(T::Array[KubeDSL::DSL::Authorization::V1::ResourceRule]) }
          def resource_rules(elem_name = nil, &block); end
        end
      end
    end

    module Autoscaling
      module V1
        class CrossVersionObjectReference < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end

        class HorizontalPodAutoscaler < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscalerStatus) }
          def status; end
        end

        class HorizontalPodAutoscalerList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscaler))).returns(T::Array[KubeDSL::DSL::Autoscaling::V1::HorizontalPodAutoscaler]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class HorizontalPodAutoscalerSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max_replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_replicas(val = nil); end

          sig { returns(KubeDSL::DSL::Autoscaling::V1::CrossVersionObjectReference) }
          def scale_target_ref; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def target_cpu_utilization_percentage(val = nil); end
        end

        class HorizontalPodAutoscalerStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_cpu_utilization_percentage(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def desired_replicas(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_scale_time(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end
        end

        class Scale < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Autoscaling::V1::ScaleSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Autoscaling::V1::ScaleStatus) }
          def status; end
        end

        class ScaleSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def replicas(val = nil); end
        end

        class ScaleStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def replicas(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def selector(val = nil); end
        end
      end

      module V2beta1
        class ContainerResourceMetricSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def container(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def target_average_utilization(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def target_average_value(val = nil); end
        end

        class ContainerResourceMetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def container(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_average_utilization(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def current_average_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end

        class CrossVersionObjectReference < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end

        class ExternalMetricSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def metric_name(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def metric_selector; end

          sig { params(val: T.nilable(String)).returns(String) }
          def target_average_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def target_value(val = nil); end
        end

        class ExternalMetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def current_average_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def current_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def metric_name(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def metric_selector; end
        end

        class HorizontalPodAutoscaler < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::HorizontalPodAutoscalerSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::HorizontalPodAutoscalerStatus) }
          def status; end
        end

        class HorizontalPodAutoscalerCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class HorizontalPodAutoscalerList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta1::HorizontalPodAutoscaler))).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta1::HorizontalPodAutoscaler]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class HorizontalPodAutoscalerSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max_replicas(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta1::MetricSpec))).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta1::MetricSpec]) }
          def metrics(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_replicas(val = nil); end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::CrossVersionObjectReference) }
          def scale_target_ref; end
        end

        class HorizontalPodAutoscalerStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta1::HorizontalPodAutoscalerCondition))).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta1::HorizontalPodAutoscalerCondition]) }
          def conditions(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta1::MetricStatus))).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta1::MetricStatus]) }
          def current_metrics(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def desired_replicas(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_scale_time(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end
        end

        class MetricSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ContainerResourceMetricSource) }
          def container_resource; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ExternalMetricSource) }
          def external; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ObjectMetricSource) }
          def object; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::PodsMetricSource) }
          def pods; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ResourceMetricSource) }
          def resource; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class MetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ContainerResourceMetricStatus) }
          def container_resource; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ExternalMetricStatus) }
          def external; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ObjectMetricStatus) }
          def object; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::PodsMetricStatus) }
          def pods; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::ResourceMetricStatus) }
          def resource; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class ObjectMetricSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def average_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def metric_name(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::CrossVersionObjectReference) }
          def target; end

          sig { params(val: T.nilable(String)).returns(String) }
          def target_value(val = nil); end
        end

        class ObjectMetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def average_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def current_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def metric_name(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta1::CrossVersionObjectReference) }
          def target; end
        end

        class PodsMetricSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def metric_name(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end

          sig { params(val: T.nilable(String)).returns(String) }
          def target_average_value(val = nil); end
        end

        class PodsMetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def current_average_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def metric_name(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end
        end

        class ResourceMetricSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def target_average_utilization(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def target_average_value(val = nil); end
        end

        class ResourceMetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_average_utilization(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def current_average_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end
      end

      module V2beta2
        class ContainerResourceMetricSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def container(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricTarget) }
          def target; end
        end

        class ContainerResourceMetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def container(val = nil); end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus) }
          def current; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end

        class CrossVersionObjectReference < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end

        class ExternalMetricSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier) }
          def metric; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricTarget) }
          def target; end
        end

        class ExternalMetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus) }
          def current; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier) }
          def metric; end
        end

        class HorizontalPodAutoscaler < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscalerSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscalerStatus) }
          def status; end
        end

        class HorizontalPodAutoscalerBehavior < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::HPAScalingRules) }
          def scale_down; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::HPAScalingRules) }
          def scale_up; end
        end

        class HorizontalPodAutoscalerCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class HorizontalPodAutoscalerList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscaler))).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscaler]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class HorizontalPodAutoscalerSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscalerBehavior) }
          def behavior; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max_replicas(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricSpec))).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta2::MetricSpec]) }
          def metrics(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min_replicas(val = nil); end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::CrossVersionObjectReference) }
          def scale_target_ref; end
        end

        class HorizontalPodAutoscalerStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscalerCondition))).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta2::HorizontalPodAutoscalerCondition]) }
          def conditions(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricStatus))).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta2::MetricStatus]) }
          def current_metrics(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_replicas(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def desired_replicas(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_scale_time(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end
        end

        class HPAScalingPolicy < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def period_seconds(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def value(val = nil); end
        end

        class HPAScalingRules < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Autoscaling::V2beta2::HPAScalingPolicy))).returns(T::Array[KubeDSL::DSL::Autoscaling::V2beta2::HPAScalingPolicy]) }
          def policies(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def select_policy(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def stabilization_window_seconds(val = nil); end
        end

        class MetricIdentifier < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end
        end

        class MetricSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ContainerResourceMetricSource) }
          def container_resource; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ExternalMetricSource) }
          def external; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ObjectMetricSource) }
          def object; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::PodsMetricSource) }
          def pods; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ResourceMetricSource) }
          def resource; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class MetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ContainerResourceMetricStatus) }
          def container_resource; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ExternalMetricStatus) }
          def external; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ObjectMetricStatus) }
          def object; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::PodsMetricStatus) }
          def pods; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::ResourceMetricStatus) }
          def resource; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class MetricTarget < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def average_utilization(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def average_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def value(val = nil); end
        end

        class MetricValueStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def average_utilization(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def average_value(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def value(val = nil); end
        end

        class ObjectMetricSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::CrossVersionObjectReference) }
          def described_object; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier) }
          def metric; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricTarget) }
          def target; end
        end

        class ObjectMetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus) }
          def current; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::CrossVersionObjectReference) }
          def described_object; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier) }
          def metric; end
        end

        class PodsMetricSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier) }
          def metric; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricTarget) }
          def target; end
        end

        class PodsMetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus) }
          def current; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricIdentifier) }
          def metric; end
        end

        class ResourceMetricSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricTarget) }
          def target; end
        end

        class ResourceMetricStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Autoscaling::V2beta2::MetricValueStatus) }
          def current; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end
      end
    end

    module Batch
      module V1
        class CronJob < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Batch::V1::CronJobSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Batch::V1::CronJobStatus) }
          def status; end
        end

        class CronJobList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Batch::V1::CronJob))).returns(T::Array[KubeDSL::DSL::Batch::V1::CronJob]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class CronJobSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def concurrency_policy(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def failed_jobs_history_limit(val = nil); end

          sig { returns(KubeDSL::DSL::Batch::V1::JobTemplateSpec) }
          def job_template; end

          sig { params(val: T.nilable(String)).returns(String) }
          def schedule(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def starting_deadline_seconds(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def successful_jobs_history_limit(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def suspend(val = nil); end
        end

        class CronJobStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ObjectReference))).returns(T::Array[KubeDSL::DSL::V1::ObjectReference]) }
          def actives(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_schedule_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_successful_time(val = nil); end
        end

        class Job < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Batch::V1::JobSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Batch::V1::JobStatus) }
          def status; end
        end

        class JobCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_probe_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class JobList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Batch::V1::Job))).returns(T::Array[KubeDSL::DSL::Batch::V1::Job]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class JobSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def active_deadline_seconds(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def backoff_limit(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def completion_mode(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def completions(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def manual_selector(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def parallelism(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def suspend(val = nil); end

          sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
          def template; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def ttl_seconds_after_finished(val = nil); end
        end

        class JobStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def active(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def completed_indexes(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def completion_time(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Batch::V1::JobCondition))).returns(T::Array[KubeDSL::DSL::Batch::V1::JobCondition]) }
          def conditions(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def failed(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def start_time(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def succeeded(val = nil); end

          sig { returns(KubeDSL::DSL::Batch::V1::UncountedTerminatedPods) }
          def uncounted_terminated_pods; end
        end

        class JobTemplateSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Batch::V1::JobSpec) }
          def spec; end
        end

        class UncountedTerminatedPods < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def failed(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def succeeded(val = nil); end
        end
      end

      module V1beta1
        class CronJob < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Batch::V1beta1::CronJobSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Batch::V1beta1::CronJobStatus) }
          def status; end
        end

        class CronJobList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Batch::V1beta1::CronJob))).returns(T::Array[KubeDSL::DSL::Batch::V1beta1::CronJob]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class CronJobSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def concurrency_policy(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def failed_jobs_history_limit(val = nil); end

          sig { returns(KubeDSL::DSL::Batch::V1beta1::JobTemplateSpec) }
          def job_template; end

          sig { params(val: T.nilable(String)).returns(String) }
          def schedule(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def starting_deadline_seconds(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def successful_jobs_history_limit(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def suspend(val = nil); end
        end

        class CronJobStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ObjectReference))).returns(T::Array[KubeDSL::DSL::V1::ObjectReference]) }
          def actives(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_schedule_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_successful_time(val = nil); end
        end

        class JobTemplateSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Batch::V1::JobSpec) }
          def spec; end
        end
      end
    end

    module Certificates
      module V1
        class CertificateSigningRequest < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Certificates::V1::CertificateSigningRequestSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Certificates::V1::CertificateSigningRequestStatus) }
          def status; end
        end

        class CertificateSigningRequestCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_update_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class CertificateSigningRequestList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Certificates::V1::CertificateSigningRequest))).returns(T::Array[KubeDSL::DSL::Certificates::V1::CertificateSigningRequest]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class CertificateSigningRequestSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def expiration_seconds(val = nil); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def extra(&block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def groups(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def request(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def signer_name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def uid(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def usages(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def username(val = nil); end
        end

        class CertificateSigningRequestStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def certificate(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Certificates::V1::CertificateSigningRequestCondition))).returns(T::Array[KubeDSL::DSL::Certificates::V1::CertificateSigningRequestCondition]) }
          def conditions(elem_name = nil, &block); end
        end
      end
    end

    module Coordination
      module V1
        class Lease < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Coordination::V1::LeaseSpec) }
          def spec; end
        end

        class LeaseList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Coordination::V1::Lease))).returns(T::Array[KubeDSL::DSL::Coordination::V1::Lease]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class LeaseSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def acquire_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def holder_identity(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def lease_duration_seconds(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def lease_transitions(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def renew_time(val = nil); end
        end
      end
    end

    module Discovery
      module V1
        class Endpoint < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def addresses(val = nil); end

          sig { returns(KubeDSL::DSL::Discovery::V1::EndpointConditions) }
          def conditions; end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def deprecated_topology(&block); end

          sig { returns(KubeDSL::DSL::Discovery::V1::EndpointHints) }
          def hints; end

          sig { params(val: T.nilable(String)).returns(String) }
          def hostname(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def node_name(val = nil); end

          sig { returns(KubeDSL::DSL::V1::ObjectReference) }
          def target_ref; end

          sig { params(val: T.nilable(String)).returns(String) }
          def zone(val = nil); end
        end

        class EndpointConditions < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def ready(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def serving(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def terminating(val = nil); end
        end

        class EndpointHints < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1::ForZone))).returns(T::Array[KubeDSL::DSL::Discovery::V1::ForZone]) }
          def for_zones(elem_name = nil, &block); end
        end

        class EndpointPort < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def app_protocol(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def port(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def protocol(val = nil); end
        end

        class EndpointSlice < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def address_type(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1::Endpoint))).returns(T::Array[KubeDSL::DSL::Discovery::V1::Endpoint]) }
          def endpoints(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1::EndpointPort))).returns(T::Array[KubeDSL::DSL::Discovery::V1::EndpointPort]) }
          def ports(elem_name = nil, &block); end
        end

        class EndpointSliceList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1::EndpointSlice))).returns(T::Array[KubeDSL::DSL::Discovery::V1::EndpointSlice]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class ForZone < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end
      end

      module V1beta1
        class Endpoint < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def addresses(val = nil); end

          sig { returns(KubeDSL::DSL::Discovery::V1beta1::EndpointConditions) }
          def conditions; end

          sig { returns(KubeDSL::DSL::Discovery::V1beta1::EndpointHints) }
          def hints; end

          sig { params(val: T.nilable(String)).returns(String) }
          def hostname(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def node_name(val = nil); end

          sig { returns(KubeDSL::DSL::V1::ObjectReference) }
          def target_ref; end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def topology(&block); end
        end

        class EndpointConditions < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def ready(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def serving(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def terminating(val = nil); end
        end

        class EndpointHints < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1beta1::ForZone))).returns(T::Array[KubeDSL::DSL::Discovery::V1beta1::ForZone]) }
          def for_zones(elem_name = nil, &block); end
        end

        class EndpointPort < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def app_protocol(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def port(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def protocol(val = nil); end
        end

        class EndpointSlice < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def address_type(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1beta1::Endpoint))).returns(T::Array[KubeDSL::DSL::Discovery::V1beta1::Endpoint]) }
          def endpoints(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1beta1::EndpointPort))).returns(T::Array[KubeDSL::DSL::Discovery::V1beta1::EndpointPort]) }
          def ports(elem_name = nil, &block); end
        end

        class EndpointSliceList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Discovery::V1beta1::EndpointSlice))).returns(T::Array[KubeDSL::DSL::Discovery::V1beta1::EndpointSlice]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class ForZone < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end
      end
    end

    module Events
      module V1
        class Event < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def action(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def deprecated_count(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def deprecated_first_timestamp(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def deprecated_last_timestamp(val = nil); end

          sig { returns(KubeDSL::DSL::V1::EventSource) }
          def deprecated_source; end

          sig { params(val: T.nilable(String)).returns(String) }
          def event_time(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(val: T.nilable(String)).returns(String) }
          def note(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { returns(KubeDSL::DSL::V1::ObjectReference) }
          def regarding; end

          sig { returns(KubeDSL::DSL::V1::ObjectReference) }
          def related; end

          sig { params(val: T.nilable(String)).returns(String) }
          def reporting_controller(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reporting_instance(val = nil); end

          sig { returns(KubeDSL::DSL::Events::V1::EventSeries) }
          def series; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class EventList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Events::V1::Event))).returns(T::Array[KubeDSL::DSL::Events::V1::Event]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class EventSeries < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def count(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_observed_time(val = nil); end
        end
      end

      module V1beta1
        class Event < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def action(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def deprecated_count(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def deprecated_first_timestamp(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def deprecated_last_timestamp(val = nil); end

          sig { returns(KubeDSL::DSL::V1::EventSource) }
          def deprecated_source; end

          sig { params(val: T.nilable(String)).returns(String) }
          def event_time(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(val: T.nilable(String)).returns(String) }
          def note(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { returns(KubeDSL::DSL::V1::ObjectReference) }
          def regarding; end

          sig { returns(KubeDSL::DSL::V1::ObjectReference) }
          def related; end

          sig { params(val: T.nilable(String)).returns(String) }
          def reporting_controller(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reporting_instance(val = nil); end

          sig { returns(KubeDSL::DSL::Events::V1beta1::EventSeries) }
          def series; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class EventList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Events::V1beta1::Event))).returns(T::Array[KubeDSL::DSL::Events::V1beta1::Event]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class EventSeries < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def count(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_observed_time(val = nil); end
        end
      end
    end

    module Flowcontrol
      module V1beta1
        class FlowDistinguisherMethod < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class FlowSchema < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchemaSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchemaStatus) }
          def status; end
        end

        class FlowSchemaCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class FlowSchemaList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchema))).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchema]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class FlowSchemaSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::FlowDistinguisherMethod) }
          def distinguisher_method; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def matching_precedence(val = nil); end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationReference) }
          def priority_level_configuration; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta1::PolicyRulesWithSubjects))).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta1::PolicyRulesWithSubjects]) }
          def rules(elem_name = nil, &block); end
        end

        class FlowSchemaStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchemaCondition))).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta1::FlowSchemaCondition]) }
          def conditions(elem_name = nil, &block); end
        end

        class GroupSubject < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end

        class LimitResponse < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::QueuingConfiguration) }
          def queuing; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class LimitedPriorityLevelConfiguration < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def assured_concurrency_shares(val = nil); end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::LimitResponse) }
          def limit_response; end
        end

        class NonResourcePolicyRule < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def non_resource_ur_ls(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def verbs(val = nil); end
        end

        class PolicyRulesWithSubjects < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta1::NonResourcePolicyRule))).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta1::NonResourcePolicyRule]) }
          def non_resource_rules(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta1::ResourcePolicyRule))).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta1::ResourcePolicyRule]) }
          def resource_rules(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta1::Subject))).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta1::Subject]) }
          def subjects(elem_name = nil, &block); end
        end

        class PriorityLevelConfiguration < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationStatus) }
          def status; end
        end

        class PriorityLevelConfigurationCondition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class PriorityLevelConfigurationList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfiguration))).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfiguration]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class PriorityLevelConfigurationReference < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end

        class PriorityLevelConfigurationSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::LimitedPriorityLevelConfiguration) }
          def limited; end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class PriorityLevelConfigurationStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationCondition))).returns(T::Array[KubeDSL::DSL::Flowcontrol::V1beta1::PriorityLevelConfigurationCondition]) }
          def conditions(elem_name = nil, &block); end
        end

        class QueuingConfiguration < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def hand_size(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def queue_length_limit(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def queues(val = nil); end
        end

        class ResourcePolicyRule < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_groups(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def cluster_scope(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespaces(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def resources(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def verbs(val = nil); end
        end

        class ServiceAccountSubject < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end
        end

        class Subject < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::GroupSubject) }
          def group; end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::ServiceAccountSubject) }
          def service_account; end

          sig { returns(KubeDSL::DSL::Flowcontrol::V1beta1::UserSubject) }
          def user; end
        end

        class UserSubject < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end
      end
    end

    module Meta
      module V1
        class APIGroup < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery) }
          def preferred_version; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR))).returns(T::Array[KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR]) }
          def server_address_by_client_cidrs(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery))).returns(T::Array[KubeDSL::DSL::Meta::V1::GroupVersionForDiscovery]) }
          def versions(elem_name = nil, &block); end
        end

        class APIGroupList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::APIGroup))).returns(T::Array[KubeDSL::DSL::Meta::V1::APIGroup]) }
          def groups(elem_name = nil, &block); end
        end

        class APIResource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def categories(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def group(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def namespaced(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def short_names(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def singular_name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def storage_version_hash(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def verbs(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def version(val = nil); end
        end

        class APIResourceList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def group_version(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::APIResource))).returns(T::Array[KubeDSL::DSL::Meta::V1::APIResource]) }
          def resources(elem_name = nil, &block); end
        end

        class APIVersions < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR))).returns(T::Array[KubeDSL::DSL::Meta::V1::ServerAddressByClientCIDR]) }
          def server_address_by_client_cidrs(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def versions(val = nil); end
        end

        class Condition < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def last_transition_time(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end

        class DeleteOptions < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def dry_run(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def grace_period_seconds(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def orphan_dependents(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::Preconditions) }
          def preconditions; end

          sig { params(val: T.nilable(String)).returns(String) }
          def propagation_policy(val = nil); end
        end

        class GroupVersionForDiscovery < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def group_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def version(val = nil); end
        end

        class LabelSelector < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::LabelSelectorRequirement))).returns(T::Array[KubeDSL::DSL::Meta::V1::LabelSelectorRequirement]) }
          def match_expressions(elem_name = nil, &block); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def match_labels(&block); end
        end

        class LabelSelectorRequirement < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def key(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def operator(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def values(val = nil); end
        end

        class ListMeta < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def continue(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def remaining_item_count(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def resource_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def self_link(val = nil); end
        end

        class ManagedFieldsEntry < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def fields_type(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def fields_v1(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def manager(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def operation(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def subresource(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def time(val = nil); end
        end

        class ObjectMeta < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def annotations(&block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def cluster_name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def creation_timestamp(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def deletion_grace_period_seconds(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def deletion_timestamp(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def finalizers(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def generate_name(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def generation(val = nil); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def labels(&block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::ManagedFieldsEntry))).returns(T::Array[KubeDSL::DSL::Meta::V1::ManagedFieldsEntry]) }
          def managed_fields(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::OwnerReference))).returns(T::Array[KubeDSL::DSL::Meta::V1::OwnerReference]) }
          def owner_references(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def resource_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def self_link(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def uid(val = nil); end
        end

        class OwnerReference < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_version(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def block_owner_deletion(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def controller(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def uid(val = nil); end
        end

        class Preconditions < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def resource_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def uid(val = nil); end
        end

        class ServerAddressByClientCIDR < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def client_cidr(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def server_address(val = nil); end
        end

        class Status < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def code(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::StatusDetails) }
          def details; end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def status(val = nil); end
        end

        class StatusCause < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def field(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reason(val = nil); end
        end

        class StatusDetails < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::StatusCause))).returns(T::Array[KubeDSL::DSL::Meta::V1::StatusCause]) }
          def causes(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def group(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def retry_after_seconds(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def uid(val = nil); end
        end

        class WatchEvent < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def object(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def type(val = nil); end
        end
      end
    end

    module Networking
      module V1
        class HTTPIngressPath < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Networking::V1::IngressBackend) }
          def backend; end

          sig { params(val: T.nilable(String)).returns(String) }
          def path(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def path_type(val = nil); end
        end

        class HTTPIngressRuleValue < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::HTTPIngressPath))).returns(T::Array[KubeDSL::DSL::Networking::V1::HTTPIngressPath]) }
          def paths(elem_name = nil, &block); end
        end

        class Ingress < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Networking::V1::IngressSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Networking::V1::IngressStatus) }
          def status; end
        end

        class IngressBackend < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::V1::TypedLocalObjectReference) }
          def resource; end

          sig { returns(KubeDSL::DSL::Networking::V1::IngressServiceBackend) }
          def service; end
        end

        class IngressClass < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Networking::V1::IngressClassSpec) }
          def spec; end
        end

        class IngressClassList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::IngressClass))).returns(T::Array[KubeDSL::DSL::Networking::V1::IngressClass]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class IngressClassParametersReference < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_group(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def scope(val = nil); end
        end

        class IngressClassSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def controller(val = nil); end

          sig { returns(KubeDSL::DSL::Networking::V1::IngressClassParametersReference) }
          def parameters; end
        end

        class IngressList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::Ingress))).returns(T::Array[KubeDSL::DSL::Networking::V1::Ingress]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class IngressRule < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def host(val = nil); end

          sig { returns(KubeDSL::DSL::Networking::V1::HTTPIngressRuleValue) }
          def http; end
        end

        class IngressServiceBackend < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { returns(KubeDSL::DSL::Networking::V1::ServiceBackendPort) }
          def port; end
        end

        class IngressSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Networking::V1::IngressBackend) }
          def default_backend; end

          sig { params(val: T.nilable(String)).returns(String) }
          def ingress_class_name(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::IngressRule))).returns(T::Array[KubeDSL::DSL::Networking::V1::IngressRule]) }
          def rules(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::IngressTLS))).returns(T::Array[KubeDSL::DSL::Networking::V1::IngressTLS]) }
          def tlses(elem_name = nil, &block); end
        end

        class IngressStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::V1::LoadBalancerStatus) }
          def load_balancer; end
        end

        class IngressTLS < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def hosts(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def secret_name(val = nil); end
        end

        class IPBlock < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def cidr(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def except(val = nil); end
        end

        class NetworkPolicy < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Networking::V1::NetworkPolicySpec) }
          def spec; end
        end

        class NetworkPolicyEgressRule < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::NetworkPolicyPort))).returns(T::Array[KubeDSL::DSL::Networking::V1::NetworkPolicyPort]) }
          def ports(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::NetworkPolicyPeer))).returns(T::Array[KubeDSL::DSL::Networking::V1::NetworkPolicyPeer]) }
          def tos(elem_name = nil, &block); end
        end

        class NetworkPolicyIngressRule < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::NetworkPolicyPeer))).returns(T::Array[KubeDSL::DSL::Networking::V1::NetworkPolicyPeer]) }
          def froms(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::NetworkPolicyPort))).returns(T::Array[KubeDSL::DSL::Networking::V1::NetworkPolicyPort]) }
          def ports(elem_name = nil, &block); end
        end

        class NetworkPolicyList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::NetworkPolicy))).returns(T::Array[KubeDSL::DSL::Networking::V1::NetworkPolicy]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class NetworkPolicyPeer < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Networking::V1::IPBlock) }
          def ip_block; end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def namespace_selector; end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def pod_selector; end
        end

        class NetworkPolicyPort < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def end_port(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def port(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def protocol(val = nil); end
        end

        class NetworkPolicySpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::NetworkPolicyEgressRule))).returns(T::Array[KubeDSL::DSL::Networking::V1::NetworkPolicyEgressRule]) }
          def egresses(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Networking::V1::NetworkPolicyIngressRule))).returns(T::Array[KubeDSL::DSL::Networking::V1::NetworkPolicyIngressRule]) }
          def ingresses(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def pod_selector; end

          sig { params(val: T.nilable(String)).returns(String) }
          def policy_types(val = nil); end
        end

        class ServiceBackendPort < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def number(val = nil); end
        end
      end
    end

    module Node
      module V1
        class Overhead < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::V1::NodeSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::V1::NodeStatus) }
          def status; end
        end

        class RuntimeClass < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::V1::NodeSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::V1::NodeStatus) }
          def status; end
        end

        class RuntimeClassList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::V1::NodeSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::V1::NodeStatus) }
          def status; end
        end

        class Scheduling < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::V1::NodeSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::V1::NodeStatus) }
          def status; end
        end
      end

      module V1alpha1
        class Overhead < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def pod_fixed(&block); end
        end

        class RuntimeClass < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Node::V1alpha1::RuntimeClassSpec) }
          def spec; end
        end

        class RuntimeClassList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Node::V1alpha1::RuntimeClass))).returns(T::Array[KubeDSL::DSL::Node::V1alpha1::RuntimeClass]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class RuntimeClassSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Node::V1alpha1::Overhead) }
          def overhead; end

          sig { params(val: T.nilable(String)).returns(String) }
          def runtime_handler(val = nil); end

          sig { returns(KubeDSL::DSL::Node::V1alpha1::Scheduling) }
          def scheduling; end
        end

        class Scheduling < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def node_selector(&block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Toleration))).returns(T::Array[KubeDSL::DSL::V1::Toleration]) }
          def tolerations(elem_name = nil, &block); end
        end
      end

      module V1beta1
        class Overhead < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def pod_fixed(&block); end
        end

        class RuntimeClass < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def handler(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Node::V1beta1::Overhead) }
          def overhead; end

          sig { returns(KubeDSL::DSL::Node::V1beta1::Scheduling) }
          def scheduling; end
        end

        class RuntimeClassList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Node::V1beta1::RuntimeClass))).returns(T::Array[KubeDSL::DSL::Node::V1beta1::RuntimeClass]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class Scheduling < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def node_selector(&block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Toleration))).returns(T::Array[KubeDSL::DSL::V1::Toleration]) }
          def tolerations(elem_name = nil, &block); end
        end
      end
    end

    module Policy
      module V1
        class Eviction < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::DeleteOptions) }
          def delete_options; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end
        end

        class PodDisruptionBudget < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Policy::V1::PodDisruptionBudgetSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Policy::V1::PodDisruptionBudgetStatus) }
          def status; end
        end

        class PodDisruptionBudgetList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1::PodDisruptionBudget))).returns(T::Array[KubeDSL::DSL::Policy::V1::PodDisruptionBudget]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class PodDisruptionBudgetSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def max_unavailable(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def min_available(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end
        end

        class PodDisruptionBudgetStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::Condition))).returns(T::Array[KubeDSL::DSL::Meta::V1::Condition]) }
          def conditions(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_healthy(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def desired_healthy(val = nil); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def disrupted_pods(&block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def disruptions_allowed(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def expected_pods(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end
        end
      end

      module V1beta1
        class AllowedCSIDriver < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end

        class AllowedFlexVolume < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def driver(val = nil); end
        end

        class AllowedHostPath < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def path_prefix(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def read_only(val = nil); end
        end

        class FSGroupStrategyOptions < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::IDRange))).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::IDRange]) }
          def ranges(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def rule(val = nil); end
        end

        class HostPortRange < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min(val = nil); end
        end

        class IDRange < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def max(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def min(val = nil); end
        end

        class PodDisruptionBudget < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::PodDisruptionBudgetSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::PodDisruptionBudgetStatus) }
          def status; end
        end

        class PodDisruptionBudgetList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::PodDisruptionBudget))).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::PodDisruptionBudget]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class PodDisruptionBudgetSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def max_unavailable(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def min_available(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def selector; end
        end

        class PodDisruptionBudgetStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::Condition))).returns(T::Array[KubeDSL::DSL::Meta::V1::Condition]) }
          def conditions(elem_name = nil, &block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def current_healthy(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def desired_healthy(val = nil); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def disrupted_pods(&block); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def disruptions_allowed(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def expected_pods(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def observed_generation(val = nil); end
        end

        class PodSecurityPolicy < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::PodSecurityPolicySpec) }
          def spec; end
        end

        class PodSecurityPolicyList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::PodSecurityPolicy))).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::PodSecurityPolicy]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class PodSecurityPolicySpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def allow_privilege_escalation(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::AllowedCSIDriver))).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::AllowedCSIDriver]) }
          def allowed_csi_drivers(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def allowed_capabilities(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::AllowedFlexVolume))).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::AllowedFlexVolume]) }
          def allowed_flex_volumes(elem_name = nil, &block); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::AllowedHostPath))).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::AllowedHostPath]) }
          def allowed_host_paths(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def allowed_proc_mount_types(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def allowed_unsafe_sysctls(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def default_add_capabilities(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def default_allow_privilege_escalation(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def forbidden_sysctls(val = nil); end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::FSGroupStrategyOptions) }
          def fs_group; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def host_ipc(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def host_network(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def host_pid(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::HostPortRange))).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::HostPortRange]) }
          def host_ports(elem_name = nil, &block); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def privileged(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def read_only_root_filesystem(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def required_drop_capabilities(val = nil); end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::RunAsGroupStrategyOptions) }
          def run_as_group; end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::RunAsUserStrategyOptions) }
          def run_as_user; end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::RuntimeClassStrategyOptions) }
          def runtime_class; end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::SELinuxStrategyOptions) }
          def se_linux; end

          sig { returns(KubeDSL::DSL::Policy::V1beta1::SupplementalGroupsStrategyOptions) }
          def supplemental_groups; end

          sig { params(val: T.nilable(String)).returns(String) }
          def volumes(val = nil); end
        end

        class RunAsGroupStrategyOptions < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::IDRange))).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::IDRange]) }
          def ranges(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def rule(val = nil); end
        end

        class RunAsUserStrategyOptions < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::IDRange))).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::IDRange]) }
          def ranges(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def rule(val = nil); end
        end

        class RuntimeClassStrategyOptions < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def allowed_runtime_class_names(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def default_runtime_class_name(val = nil); end
        end

        class SELinuxStrategyOptions < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def rule(val = nil); end

          sig { returns(KubeDSL::DSL::V1::SELinuxOptions) }
          def se_linux_options; end
        end

        class SupplementalGroupsStrategyOptions < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Policy::V1beta1::IDRange))).returns(T::Array[KubeDSL::DSL::Policy::V1beta1::IDRange]) }
          def ranges(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def rule(val = nil); end
        end
      end
    end

    module Rbac
      module V1
        class AggregationRule < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::LabelSelector))).returns(T::Array[KubeDSL::DSL::Meta::V1::LabelSelector]) }
          def cluster_role_selectors(elem_name = nil, &block); end
        end

        class ClusterRole < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Rbac::V1::AggregationRule) }
          def aggregation_rule; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1::PolicyRule))).returns(T::Array[KubeDSL::DSL::Rbac::V1::PolicyRule]) }
          def rules(elem_name = nil, &block); end
        end

        class ClusterRoleBinding < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Rbac::V1::RoleRef) }
          def role_ref; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1::Subject))).returns(T::Array[KubeDSL::DSL::Rbac::V1::Subject]) }
          def subjects(elem_name = nil, &block); end
        end

        class ClusterRoleBindingList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1::ClusterRoleBinding))).returns(T::Array[KubeDSL::DSL::Rbac::V1::ClusterRoleBinding]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class ClusterRoleList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1::ClusterRole))).returns(T::Array[KubeDSL::DSL::Rbac::V1::ClusterRole]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class PolicyRule < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_groups(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def non_resource_ur_ls(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def resource_names(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def resources(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def verbs(val = nil); end
        end

        class Role < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1::PolicyRule))).returns(T::Array[KubeDSL::DSL::Rbac::V1::PolicyRule]) }
          def rules(elem_name = nil, &block); end
        end

        class RoleBinding < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Rbac::V1::RoleRef) }
          def role_ref; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1::Subject))).returns(T::Array[KubeDSL::DSL::Rbac::V1::Subject]) }
          def subjects(elem_name = nil, &block); end
        end

        class RoleBindingList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1::RoleBinding))).returns(T::Array[KubeDSL::DSL::Rbac::V1::RoleBinding]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class RoleList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1::Role))).returns(T::Array[KubeDSL::DSL::Rbac::V1::Role]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class RoleRef < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_group(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end

        class Subject < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_group(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end
        end
      end

      module V1alpha1
        class AggregationRule < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::LabelSelector))).returns(T::Array[KubeDSL::DSL::Meta::V1::LabelSelector]) }
          def cluster_role_selectors(elem_name = nil, &block); end
        end

        class ClusterRole < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Rbac::V1alpha1::AggregationRule) }
          def aggregation_rule; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1alpha1::PolicyRule))).returns(T::Array[KubeDSL::DSL::Rbac::V1alpha1::PolicyRule]) }
          def rules(elem_name = nil, &block); end
        end

        class ClusterRoleBinding < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Rbac::V1alpha1::RoleRef) }
          def role_ref; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1alpha1::Subject))).returns(T::Array[KubeDSL::DSL::Rbac::V1alpha1::Subject]) }
          def subjects(elem_name = nil, &block); end
        end

        class ClusterRoleBindingList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1alpha1::ClusterRoleBinding))).returns(T::Array[KubeDSL::DSL::Rbac::V1alpha1::ClusterRoleBinding]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class ClusterRoleList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1alpha1::ClusterRole))).returns(T::Array[KubeDSL::DSL::Rbac::V1alpha1::ClusterRole]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class PolicyRule < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_groups(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def non_resource_ur_ls(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def resource_names(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def resources(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def verbs(val = nil); end
        end

        class Role < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1alpha1::PolicyRule))).returns(T::Array[KubeDSL::DSL::Rbac::V1alpha1::PolicyRule]) }
          def rules(elem_name = nil, &block); end
        end

        class RoleBinding < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Rbac::V1alpha1::RoleRef) }
          def role_ref; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1alpha1::Subject))).returns(T::Array[KubeDSL::DSL::Rbac::V1alpha1::Subject]) }
          def subjects(elem_name = nil, &block); end
        end

        class RoleBindingList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1alpha1::RoleBinding))).returns(T::Array[KubeDSL::DSL::Rbac::V1alpha1::RoleBinding]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class RoleList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Rbac::V1alpha1::Role))).returns(T::Array[KubeDSL::DSL::Rbac::V1alpha1::Role]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class RoleRef < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_group(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end
        end

        class Subject < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def api_version(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def kind(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def namespace(val = nil); end
        end
      end
    end

    module Scheduling
      module V1
        class PriorityClass < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def description(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def global_default(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(val: T.nilable(String)).returns(String) }
          def preemption_policy(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def value(val = nil); end
        end

        class PriorityClassList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Scheduling::V1::PriorityClass))).returns(T::Array[KubeDSL::DSL::Scheduling::V1::PriorityClass]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end
      end

      module V1alpha1
        class PriorityClass < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def description(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def global_default(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(val: T.nilable(String)).returns(String) }
          def preemption_policy(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def value(val = nil); end
        end

        class PriorityClassList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Scheduling::V1alpha1::PriorityClass))).returns(T::Array[KubeDSL::DSL::Scheduling::V1alpha1::PriorityClass]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end
      end
    end

    module Storage
      module V1
        class CSIDriver < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Storage::V1::CSIDriverSpec) }
          def spec; end
        end

        class CSIDriverList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Storage::V1::CSIDriver))).returns(T::Array[KubeDSL::DSL::Storage::V1::CSIDriver]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class CSIDriverSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def attach_required(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def fs_group_policy(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def pod_info_on_mount(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def requires_republish(val = nil); end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def storage_capacity(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Storage::V1::TokenRequest))).returns(T::Array[KubeDSL::DSL::Storage::V1::TokenRequest]) }
          def token_requests(elem_name = nil, &block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def volume_lifecycle_modes(val = nil); end
        end

        class CSINode < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Storage::V1::CSINodeSpec) }
          def spec; end
        end

        class CSINodeDriver < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Storage::V1::VolumeNodeResources) }
          def allocatable; end

          sig { params(val: T.nilable(String)).returns(String) }
          def name(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def node_id(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def topology_keys(val = nil); end
        end

        class CSINodeList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Storage::V1::CSINode))).returns(T::Array[KubeDSL::DSL::Storage::V1::CSINode]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class CSINodeSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Storage::V1::CSINodeDriver))).returns(T::Array[KubeDSL::DSL::Storage::V1::CSINodeDriver]) }
          def drivers(elem_name = nil, &block); end
        end

        class StorageClass < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def allow_volume_expansion(val = nil); end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::TopologySelectorTerm))).returns(T::Array[KubeDSL::DSL::V1::TopologySelectorTerm]) }
          def allowed_topologies(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(val: T.nilable(String)).returns(String) }
          def mount_options(val = nil); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def parameters(&block); end

          sig { params(val: T.nilable(String)).returns(String) }
          def provisioner(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def reclaim_policy(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def volume_binding_mode(val = nil); end
        end

        class StorageClassList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Storage::V1::StorageClass))).returns(T::Array[KubeDSL::DSL::Storage::V1::StorageClass]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class TokenRequest < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def audience(val = nil); end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def expiration_seconds(val = nil); end
        end

        class VolumeAttachment < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Storage::V1::VolumeAttachmentSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Storage::V1::VolumeAttachmentStatus) }
          def status; end
        end

        class VolumeAttachmentList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Storage::V1::VolumeAttachment))).returns(T::Array[KubeDSL::DSL::Storage::V1::VolumeAttachment]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class VolumeAttachmentSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::V1::PersistentVolumeSpec) }
          def inline_volume_spec; end

          sig { params(val: T.nilable(String)).returns(String) }
          def persistent_volume_name(val = nil); end
        end

        class VolumeAttachmentSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def attacher(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def node_name(val = nil); end

          sig { returns(KubeDSL::DSL::Storage::V1::VolumeAttachmentSource) }
          def source; end
        end

        class VolumeAttachmentStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Storage::V1::VolumeError) }
          def attach_error; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def attached(val = nil); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def attachment_metadata(&block); end

          sig { returns(KubeDSL::DSL::Storage::V1::VolumeError) }
          def detach_error; end
        end

        class VolumeError < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def time(val = nil); end
        end

        class VolumeNodeResources < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def count(val = nil); end
        end
      end

      module V1alpha1
        class CSIStorageCapacity < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def capacity(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def maximum_volume_size(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def node_topology; end

          sig { params(val: T.nilable(String)).returns(String) }
          def storage_class_name(val = nil); end
        end

        class CSIStorageCapacityList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Storage::V1alpha1::CSIStorageCapacity))).returns(T::Array[KubeDSL::DSL::Storage::V1alpha1::CSIStorageCapacity]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class VolumeAttachment < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Storage::V1alpha1::VolumeAttachmentSpec) }
          def spec; end

          sig { returns(KubeDSL::DSL::Storage::V1alpha1::VolumeAttachmentStatus) }
          def status; end
        end

        class VolumeAttachmentList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Storage::V1alpha1::VolumeAttachment))).returns(T::Array[KubeDSL::DSL::Storage::V1alpha1::VolumeAttachment]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end

        class VolumeAttachmentSource < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::V1::PersistentVolumeSpec) }
          def inline_volume_spec; end

          sig { params(val: T.nilable(String)).returns(String) }
          def persistent_volume_name(val = nil); end
        end

        class VolumeAttachmentSpec < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def attacher(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def node_name(val = nil); end

          sig { returns(KubeDSL::DSL::Storage::V1alpha1::VolumeAttachmentSource) }
          def source; end
        end

        class VolumeAttachmentStatus < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { returns(KubeDSL::DSL::Storage::V1alpha1::VolumeError) }
          def attach_error; end

          sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
          def attached(val = nil); end

          sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
          def attachment_metadata(&block); end

          sig { returns(KubeDSL::DSL::Storage::V1alpha1::VolumeError) }
          def detach_error; end
        end

        class VolumeError < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def message(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def time(val = nil); end
        end
      end

      module V1beta1
        class CSIStorageCapacity < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(val: T.nilable(String)).returns(String) }
          def capacity(val = nil); end

          sig { params(val: T.nilable(String)).returns(String) }
          def maximum_volume_size(val = nil); end

          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
          def node_topology; end

          sig { params(val: T.nilable(String)).returns(String) }
          def storage_class_name(val = nil); end
        end

        class CSIStorageCapacityList < ::KubeDSL::DSLObject
          sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end

          sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Storage::V1beta1::CSIStorageCapacity))).returns(T::Array[KubeDSL::DSL::Storage::V1beta1::CSIStorageCapacity]) }
          def items(elem_name = nil, &block); end

          sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
          def metadata; end
        end
      end
    end

    module V1
      class Affinity < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::NodeAffinity) }
        def node_affinity; end

        sig { returns(KubeDSL::DSL::V1::PodAffinity) }
        def pod_affinity; end

        sig { returns(KubeDSL::DSL::V1::PodAntiAffinity) }
        def pod_anti_affinity; end
      end

      class AttachedVolume < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def device_path(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end
      end

      class AWSElasticBlockStoreVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def partition(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_id(val = nil); end
      end

      class AzureDiskVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def caching_mode(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def disk_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def disk_uri(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def kind(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end
      end

      class AzureFilePersistentVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def secret_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def secret_namespace(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def share_name(val = nil); end
      end

      class AzureFileVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def secret_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def share_name(val = nil); end
      end

      class Binding < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::ObjectReference) }
        def target; end
      end

      class Capabilities < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def add(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def drop(val = nil); end
      end

      class CephFSPersistentVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def monitors(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def secret_file(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def user(val = nil); end
      end

      class CephFSVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def monitors(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def secret_file(val = nil); end

        sig { returns(KubeDSL::DSL::V1::LocalObjectReference) }
        def secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def user(val = nil); end
      end

      class CinderPersistentVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_id(val = nil); end
      end

      class CinderVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::LocalObjectReference) }
        def secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_id(val = nil); end
      end

      class ClientIPConfig < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def timeout_seconds(val = nil); end
      end

      class ComponentCondition < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def error(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def status(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class ComponentStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ComponentCondition))).returns(T::Array[KubeDSL::DSL::V1::ComponentCondition]) }
        def conditions(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end
      end

      class ComponentStatusList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ComponentStatus))).returns(T::Array[KubeDSL::DSL::V1::ComponentStatus]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class ConfigMap < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def binary_data(&block); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def data(&block); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def immutable(val = nil); end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end
      end

      class ConfigMapEnvSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def optional(val = nil); end
      end

      class ConfigMapKeySelector < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def key(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def optional(val = nil); end
      end

      class ConfigMapList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ConfigMap))).returns(T::Array[KubeDSL::DSL::V1::ConfigMap]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class ConfigMapNodeConfigSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def kubelet_config_key(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def namespace(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def resource_version(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def uid(val = nil); end
      end

      class ConfigMapProjection < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::KeyToPath))).returns(T::Array[KubeDSL::DSL::V1::KeyToPath]) }
        def items(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def optional(val = nil); end
      end

      class ConfigMapVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def default_mode(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::KeyToPath))).returns(T::Array[KubeDSL::DSL::V1::KeyToPath]) }
        def items(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def optional(val = nil); end
      end

      class Container < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def args(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def command(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EnvVar))).returns(T::Array[KubeDSL::DSL::V1::EnvVar]) }
        def envs(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EnvFromSource))).returns(T::Array[KubeDSL::DSL::V1::EnvFromSource]) }
        def env_froms(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def image(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def image_pull_policy(val = nil); end

        sig { returns(KubeDSL::DSL::V1::Lifecycle) }
        def lifecycle; end

        sig { returns(KubeDSL::DSL::V1::Probe) }
        def liveness_probe; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerPort))).returns(T::Array[KubeDSL::DSL::V1::ContainerPort]) }
        def ports(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::V1::Probe) }
        def readiness_probe; end

        sig { returns(KubeDSL::DSL::V1::ResourceRequirements) }
        def resources; end

        sig { returns(KubeDSL::DSL::V1::SecurityContext) }
        def security_context; end

        sig { returns(KubeDSL::DSL::V1::Probe) }
        def startup_probe; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def stdin(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def stdin_once(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def termination_message_path(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def termination_message_policy(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def tty(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::VolumeDevice))).returns(T::Array[KubeDSL::DSL::V1::VolumeDevice]) }
        def volume_devices(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::VolumeMount))).returns(T::Array[KubeDSL::DSL::V1::VolumeMount]) }
        def volume_mounts(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def working_dir(val = nil); end
      end

      class ContainerImage < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def names(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def size_bytes(val = nil); end
      end

      class ContainerPort < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def container_port(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def host_ip(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def host_port(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def protocol(val = nil); end
      end

      class ContainerState < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::ContainerStateRunning) }
        def running; end

        sig { returns(KubeDSL::DSL::V1::ContainerStateTerminated) }
        def terminated; end

        sig { returns(KubeDSL::DSL::V1::ContainerStateWaiting) }
        def waiting; end
      end

      class ContainerStateRunning < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def started_at(val = nil); end
      end

      class ContainerStateTerminated < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def container_id(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def exit_code(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def finished_at(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def reason(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def signal(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def started_at(val = nil); end
      end

      class ContainerStateWaiting < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def reason(val = nil); end
      end

      class ContainerStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def container_id(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def image(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def image_id(val = nil); end

        sig { returns(KubeDSL::DSL::V1::ContainerState) }
        def last_state; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def ready(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def restart_count(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def started(val = nil); end

        sig { returns(KubeDSL::DSL::V1::ContainerState) }
        def state; end
      end

      class CSIPersistentVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def controller_expand_secret_ref; end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def controller_publish_secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def driver(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def node_publish_secret_ref; end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def node_stage_secret_ref; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def volume_attributes(&block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_handle(val = nil); end
      end

      class CSIVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def driver(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { returns(KubeDSL::DSL::V1::LocalObjectReference) }
        def node_publish_secret_ref; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def volume_attributes(&block); end
      end

      class DaemonEndpoint < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def port(val = nil); end
      end

      class DownwardAPIProjection < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::DownwardAPIVolumeFile))).returns(T::Array[KubeDSL::DSL::V1::DownwardAPIVolumeFile]) }
        def items(elem_name = nil, &block); end
      end

      class DownwardAPIVolumeFile < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::ObjectFieldSelector) }
        def field_ref; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def mode(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end

        sig { returns(KubeDSL::DSL::V1::ResourceFieldSelector) }
        def resource_field_ref; end
      end

      class DownwardAPIVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def default_mode(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::DownwardAPIVolumeFile))).returns(T::Array[KubeDSL::DSL::V1::DownwardAPIVolumeFile]) }
        def items(elem_name = nil, &block); end
      end

      class EmptyDirVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def medium(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def size_limit(val = nil); end
      end

      class EndpointAddress < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def hostname(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def ip(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def node_name(val = nil); end

        sig { returns(KubeDSL::DSL::V1::ObjectReference) }
        def target_ref; end
      end

      class EndpointPort < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def app_protocol(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def port(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def protocol(val = nil); end
      end

      class EndpointSubset < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EndpointAddress))).returns(T::Array[KubeDSL::DSL::V1::EndpointAddress]) }
        def addresses(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EndpointAddress))).returns(T::Array[KubeDSL::DSL::V1::EndpointAddress]) }
        def not_ready_addresses(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EndpointPort))).returns(T::Array[KubeDSL::DSL::V1::EndpointPort]) }
        def ports(elem_name = nil, &block); end
      end

      class Endpoints < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EndpointSubset))).returns(T::Array[KubeDSL::DSL::V1::EndpointSubset]) }
        def subsets(elem_name = nil, &block); end
      end

      class EndpointsList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Endpoints))).returns(T::Array[KubeDSL::DSL::V1::Endpoints]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class EnvFromSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::ConfigMapEnvSource) }
        def config_map_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def prefix(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SecretEnvSource) }
        def secret_ref; end
      end

      class EnvVar < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def value(val = nil); end

        sig { returns(KubeDSL::DSL::V1::EnvVarSource) }
        def value_from; end
      end

      class EnvVarSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::ConfigMapKeySelector) }
        def config_map_key_ref; end

        sig { returns(KubeDSL::DSL::V1::ObjectFieldSelector) }
        def field_ref; end

        sig { returns(KubeDSL::DSL::V1::ResourceFieldSelector) }
        def resource_field_ref; end

        sig { returns(KubeDSL::DSL::V1::SecretKeySelector) }
        def secret_key_ref; end
      end

      class EphemeralContainer < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def args(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def command(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EnvVar))).returns(T::Array[KubeDSL::DSL::V1::EnvVar]) }
        def envs(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EnvFromSource))).returns(T::Array[KubeDSL::DSL::V1::EnvFromSource]) }
        def env_froms(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def image(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def image_pull_policy(val = nil); end

        sig { returns(KubeDSL::DSL::V1::Lifecycle) }
        def lifecycle; end

        sig { returns(KubeDSL::DSL::V1::Probe) }
        def liveness_probe; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerPort))).returns(T::Array[KubeDSL::DSL::V1::ContainerPort]) }
        def ports(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::V1::Probe) }
        def readiness_probe; end

        sig { returns(KubeDSL::DSL::V1::ResourceRequirements) }
        def resources; end

        sig { returns(KubeDSL::DSL::V1::SecurityContext) }
        def security_context; end

        sig { returns(KubeDSL::DSL::V1::Probe) }
        def startup_probe; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def stdin(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def stdin_once(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def target_container_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def termination_message_path(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def termination_message_policy(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def tty(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::VolumeDevice))).returns(T::Array[KubeDSL::DSL::V1::VolumeDevice]) }
        def volume_devices(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::VolumeMount))).returns(T::Array[KubeDSL::DSL::V1::VolumeMount]) }
        def volume_mounts(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def working_dir(val = nil); end
      end

      class EphemeralVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::PersistentVolumeClaimTemplate) }
        def volume_claim_template; end
      end

      class Event < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def action(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def count(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def event_time(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def first_timestamp(val = nil); end

        sig { returns(KubeDSL::DSL::V1::ObjectReference) }
        def involved_object; end

        sig { params(val: T.nilable(String)).returns(String) }
        def last_timestamp(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { params(val: T.nilable(String)).returns(String) }
        def reason(val = nil); end

        sig { returns(KubeDSL::DSL::V1::ObjectReference) }
        def related; end

        sig { params(val: T.nilable(String)).returns(String) }
        def reporting_component(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def reporting_instance(val = nil); end

        sig { returns(KubeDSL::DSL::V1::EventSeries) }
        def series; end

        sig { returns(KubeDSL::DSL::V1::EventSource) }
        def source; end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class EventList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Event))).returns(T::Array[KubeDSL::DSL::V1::Event]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class EventSeries < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def count(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def last_observed_time(val = nil); end
      end

      class EventSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def component(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def host(val = nil); end
      end

      class ExecAction < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def command(val = nil); end
      end

      class FCVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def lun(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def target_ww_ns(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def wwids(val = nil); end
      end

      class FlexPersistentVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def driver(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def options(&block); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def secret_ref; end
      end

      class FlexVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def driver(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def options(&block); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::LocalObjectReference) }
        def secret_ref; end
      end

      class FlockerVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def dataset_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def dataset_uuid(val = nil); end
      end

      class GCEPersistentDiskVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def partition(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def pd_name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end
      end

      class GitRepoVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def directory(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def repository(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def revision(val = nil); end
      end

      class GlusterfsPersistentVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def endpoints(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def endpoints_namespace(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end
      end

      class GlusterfsVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def endpoints(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end
      end

      class Handler < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::ExecAction) }
        def exec; end

        sig { returns(KubeDSL::DSL::V1::HTTPGetAction) }
        def http_get; end

        sig { returns(KubeDSL::DSL::V1::TCPSocketAction) }
        def tcp_socket; end
      end

      class HostAlias < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def hostnames(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def ip(val = nil); end
      end

      class HostPathVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class HTTPGetAction < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def host(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::HTTPHeader))).returns(T::Array[KubeDSL::DSL::V1::HTTPHeader]) }
        def http_headers(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def port(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def scheme(val = nil); end
      end

      class HTTPHeader < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def value(val = nil); end
      end

      class ISCSIPersistentVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def chap_auth_discovery(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def chap_auth_session(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def initiator_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def iqn(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def iscsi_interface(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def lun(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def portals(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def target_portal(val = nil); end
      end

      class ISCSIVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def chap_auth_discovery(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def chap_auth_session(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def initiator_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def iqn(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def iscsi_interface(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def lun(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def portals(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::LocalObjectReference) }
        def secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def target_portal(val = nil); end
      end

      class KeyToPath < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def key(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def mode(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end
      end

      class Lifecycle < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::Handler) }
        def post_start; end

        sig { returns(KubeDSL::DSL::V1::Handler) }
        def pre_stop; end
      end

      class LimitRange < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::LimitRangeSpec) }
        def spec; end
      end

      class LimitRangeItem < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def default(&block); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def default_request(&block); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def max(&block); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def max_limit_request_ratio(&block); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def min(&block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class LimitRangeList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::LimitRange))).returns(T::Array[KubeDSL::DSL::V1::LimitRange]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class LimitRangeSpec < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::LimitRangeItem))).returns(T::Array[KubeDSL::DSL::V1::LimitRangeItem]) }
        def limits(elem_name = nil, &block); end
      end

      class LoadBalancerIngress < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def hostname(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def ip(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PortStatus))).returns(T::Array[KubeDSL::DSL::V1::PortStatus]) }
        def ports(elem_name = nil, &block); end
      end

      class LoadBalancerStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::LoadBalancerIngress))).returns(T::Array[KubeDSL::DSL::V1::LoadBalancerIngress]) }
        def ingresses(elem_name = nil, &block); end
      end

      class LocalObjectReference < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end
      end

      class LocalVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end
      end

      class Namespace < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::NamespaceSpec) }
        def spec; end

        sig { returns(KubeDSL::DSL::V1::NamespaceStatus) }
        def status; end
      end

      class NamespaceCondition < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def last_transition_time(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def reason(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def status(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class NamespaceList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Namespace))).returns(T::Array[KubeDSL::DSL::V1::Namespace]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class NamespaceSpec < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def finalizers(val = nil); end
      end

      class NamespaceStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::NamespaceCondition))).returns(T::Array[KubeDSL::DSL::V1::NamespaceCondition]) }
        def conditions(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def phase(val = nil); end
      end

      class NFSVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def server(val = nil); end
      end

      class Node < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::NodeSpec) }
        def spec; end

        sig { returns(KubeDSL::DSL::V1::NodeStatus) }
        def status; end
      end

      class NodeAddress < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def address(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class NodeAffinity < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PreferredSchedulingTerm))).returns(T::Array[KubeDSL::DSL::V1::PreferredSchedulingTerm]) }
        def preferred_during_scheduling_ignored_during_executions(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::V1::NodeSelector) }
        def required_during_scheduling_ignored_during_execution; end
      end

      class NodeCondition < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def last_heartbeat_time(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def last_transition_time(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def reason(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def status(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class NodeConfigSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::ConfigMapNodeConfigSource) }
        def config_map; end
      end

      class NodeConfigStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::NodeConfigSource) }
        def active; end

        sig { returns(KubeDSL::DSL::V1::NodeConfigSource) }
        def assigned; end

        sig { params(val: T.nilable(String)).returns(String) }
        def error(val = nil); end

        sig { returns(KubeDSL::DSL::V1::NodeConfigSource) }
        def last_known_good; end
      end

      class NodeDaemonEndpoints < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::DaemonEndpoint) }
        def kubelet_endpoint; end
      end

      class NodeList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Node))).returns(T::Array[KubeDSL::DSL::V1::Node]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class NodeSelector < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::NodeSelectorTerm))).returns(T::Array[KubeDSL::DSL::V1::NodeSelectorTerm]) }
        def node_selector_terms(elem_name = nil, &block); end
      end

      class NodeSelectorRequirement < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def key(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def operator(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def values(val = nil); end
      end

      class NodeSelectorTerm < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::NodeSelectorRequirement))).returns(T::Array[KubeDSL::DSL::V1::NodeSelectorRequirement]) }
        def match_expressions(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::NodeSelectorRequirement))).returns(T::Array[KubeDSL::DSL::V1::NodeSelectorRequirement]) }
        def match_fields(elem_name = nil, &block); end
      end

      class NodeSpec < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::NodeConfigSource) }
        def config_source; end

        sig { params(val: T.nilable(String)).returns(String) }
        def external_id(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def pod_cidr(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def pod_cid_rs(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def provider_id(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Taint))).returns(T::Array[KubeDSL::DSL::V1::Taint]) }
        def taints(elem_name = nil, &block); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def unschedulable(val = nil); end
      end

      class NodeStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::NodeAddress))).returns(T::Array[KubeDSL::DSL::V1::NodeAddress]) }
        def addresses(elem_name = nil, &block); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def allocatable(&block); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def capacity(&block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::NodeCondition))).returns(T::Array[KubeDSL::DSL::V1::NodeCondition]) }
        def conditions(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::V1::NodeConfigStatus) }
        def config; end

        sig { returns(KubeDSL::DSL::V1::NodeDaemonEndpoints) }
        def daemon_endpoints; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerImage))).returns(T::Array[KubeDSL::DSL::V1::ContainerImage]) }
        def images(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::V1::NodeSystemInfo) }
        def node_info; end

        sig { params(val: T.nilable(String)).returns(String) }
        def phase(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::AttachedVolume))).returns(T::Array[KubeDSL::DSL::V1::AttachedVolume]) }
        def volumes_attacheds(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volumes_in_use(val = nil); end
      end

      class NodeSystemInfo < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def architecture(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def boot_id(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def container_runtime_version(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def kernel_version(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def kube_proxy_version(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def kubelet_version(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def machine_id(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def operating_system(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def os_image(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def system_uuid(val = nil); end
      end

      class ObjectFieldSelector < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def api_version(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def field_path(val = nil); end
      end

      class ObjectReference < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def api_version(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def field_path(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def kind(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def namespace(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def resource_version(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def uid(val = nil); end
      end

      class PersistentVolume < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::PersistentVolumeSpec) }
        def spec; end

        sig { returns(KubeDSL::DSL::V1::PersistentVolumeStatus) }
        def status; end
      end

      class PersistentVolumeClaim < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::PersistentVolumeClaimSpec) }
        def spec; end

        sig { returns(KubeDSL::DSL::V1::PersistentVolumeClaimStatus) }
        def status; end
      end

      class PersistentVolumeClaimCondition < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def last_probe_time(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def last_transition_time(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def reason(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def status(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class PersistentVolumeClaimList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PersistentVolumeClaim))).returns(T::Array[KubeDSL::DSL::V1::PersistentVolumeClaim]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class PersistentVolumeClaimSpec < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def access_modes(val = nil); end

        sig { returns(KubeDSL::DSL::V1::TypedLocalObjectReference) }
        def data_source; end

        sig { returns(KubeDSL::DSL::V1::TypedLocalObjectReference) }
        def data_source_ref; end

        sig { returns(KubeDSL::DSL::V1::ResourceRequirements) }
        def resources; end

        sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
        def selector; end

        sig { params(val: T.nilable(String)).returns(String) }
        def storage_class_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_mode(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_name(val = nil); end
      end

      class PersistentVolumeClaimStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def access_modes(val = nil); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def capacity(&block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PersistentVolumeClaimCondition))).returns(T::Array[KubeDSL::DSL::V1::PersistentVolumeClaimCondition]) }
        def conditions(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def phase(val = nil); end
      end

      class PersistentVolumeClaimTemplate < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::PersistentVolumeClaimSpec) }
        def spec; end
      end

      class PersistentVolumeClaimVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def claim_name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end
      end

      class PersistentVolumeList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PersistentVolume))).returns(T::Array[KubeDSL::DSL::V1::PersistentVolume]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class PersistentVolumeSpec < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
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

      class PersistentVolumeStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def phase(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def reason(val = nil); end
      end

      class PhotonPersistentDiskVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def pd_id(val = nil); end
      end

      class Pod < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::PodSpec) }
        def spec; end

        sig { returns(KubeDSL::DSL::V1::PodStatus) }
        def status; end
      end

      class PodAffinity < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::WeightedPodAffinityTerm))).returns(T::Array[KubeDSL::DSL::V1::WeightedPodAffinityTerm]) }
        def preferred_during_scheduling_ignored_during_executions(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodAffinityTerm))).returns(T::Array[KubeDSL::DSL::V1::PodAffinityTerm]) }
        def required_during_scheduling_ignored_during_executions(elem_name = nil, &block); end
      end

      class PodAffinityTerm < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
        def label_selector; end

        sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
        def namespace_selector; end

        sig { params(val: T.nilable(String)).returns(String) }
        def namespaces(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def topology_key(val = nil); end
      end

      class PodAntiAffinity < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::WeightedPodAffinityTerm))).returns(T::Array[KubeDSL::DSL::V1::WeightedPodAffinityTerm]) }
        def preferred_during_scheduling_ignored_during_executions(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodAffinityTerm))).returns(T::Array[KubeDSL::DSL::V1::PodAffinityTerm]) }
        def required_during_scheduling_ignored_during_executions(elem_name = nil, &block); end
      end

      class PodCondition < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def last_probe_time(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def last_transition_time(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def reason(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def status(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class PodDNSConfig < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def nameservers(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodDNSConfigOption))).returns(T::Array[KubeDSL::DSL::V1::PodDNSConfigOption]) }
        def options(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def searches(val = nil); end
      end

      class PodDNSConfigOption < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def value(val = nil); end
      end

      class PodIP < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def ip(val = nil); end
      end

      class PodList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Pod))).returns(T::Array[KubeDSL::DSL::V1::Pod]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class PodReadinessGate < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def condition_type(val = nil); end
      end

      class PodSecurityContext < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def fs_group(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_group_change_policy(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def run_as_group(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def run_as_non_root(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def run_as_user(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SELinuxOptions) }
        def se_linux_options; end

        sig { returns(KubeDSL::DSL::V1::SeccompProfile) }
        def seccomp_profile; end

        sig { params(val: T.nilable(String)).returns(String) }
        def supplemental_groups(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Sysctl))).returns(T::Array[KubeDSL::DSL::V1::Sysctl]) }
        def sysctlses(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::V1::WindowsSecurityContextOptions) }
        def windows_options; end
      end

      class PodSpec < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def active_deadline_seconds(val = nil); end

        sig { returns(KubeDSL::DSL::V1::Affinity) }
        def affinity; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def automount_service_account_token(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Container))).returns(T::Array[KubeDSL::DSL::V1::Container]) }
        def containers(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::V1::PodDNSConfig) }
        def dns_config; end

        sig { params(val: T.nilable(String)).returns(String) }
        def dns_policy(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def enable_service_links(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::EphemeralContainer))).returns(T::Array[KubeDSL::DSL::V1::EphemeralContainer]) }
        def ephemeral_containers(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::HostAlias))).returns(T::Array[KubeDSL::DSL::V1::HostAlias]) }
        def host_aliases(elem_name = nil, &block); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def host_ipc(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def host_network(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def host_pid(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def hostname(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::LocalObjectReference))).returns(T::Array[KubeDSL::DSL::V1::LocalObjectReference]) }
        def image_pull_secrets(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Container))).returns(T::Array[KubeDSL::DSL::V1::Container]) }
        def init_containers(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def node_name(val = nil); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def node_selector(&block); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def overhead(&block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def preemption_policy(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def priority(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def priority_class_name(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodReadinessGate))).returns(T::Array[KubeDSL::DSL::V1::PodReadinessGate]) }
        def readiness_gates(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def restart_policy(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def runtime_class_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def scheduler_name(val = nil); end

        sig { returns(KubeDSL::DSL::V1::PodSecurityContext) }
        def security_context; end

        sig { params(val: T.nilable(String)).returns(String) }
        def service_account(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def service_account_name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def set_hostname_as_fqdn(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def share_process_namespace(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def subdomain(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def termination_grace_period_seconds(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Toleration))).returns(T::Array[KubeDSL::DSL::V1::Toleration]) }
        def tolerations(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::TopologySpreadConstraint))).returns(T::Array[KubeDSL::DSL::V1::TopologySpreadConstraint]) }
        def topology_spread_constraints(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Volume))).returns(T::Array[KubeDSL::DSL::V1::Volume]) }
        def volumes(elem_name = nil, &block); end
      end

      class PodStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodCondition))).returns(T::Array[KubeDSL::DSL::V1::PodCondition]) }
        def conditions(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerStatus))).returns(T::Array[KubeDSL::DSL::V1::ContainerStatus]) }
        def container_statuses(elem_name = nil, &block); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerStatus))).returns(T::Array[KubeDSL::DSL::V1::ContainerStatus]) }
        def ephemeral_container_statuses(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def host_ip(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ContainerStatus))).returns(T::Array[KubeDSL::DSL::V1::ContainerStatus]) }
        def init_container_statuses(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def nominated_node_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def phase(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def pod_ip(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodIP))).returns(T::Array[KubeDSL::DSL::V1::PodIP]) }
        def pod_ips(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def qos_class(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def reason(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def start_time(val = nil); end
      end

      class PodTemplate < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
        def template; end
      end

      class PodTemplateList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::PodTemplate))).returns(T::Array[KubeDSL::DSL::V1::PodTemplate]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class PodTemplateSpec < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::PodSpec) }
        def spec; end
      end

      class PortStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def error(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def port(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def protocol(val = nil); end
      end

      class PortworxVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_id(val = nil); end
      end

      class PreferredSchedulingTerm < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::NodeSelectorTerm) }
        def preference; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def weight(val = nil); end
      end

      class Probe < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::ExecAction) }
        def exec; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def failure_threshold(val = nil); end

        sig { returns(KubeDSL::DSL::V1::HTTPGetAction) }
        def http_get; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def initial_delay_seconds(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def period_seconds(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def success_threshold(val = nil); end

        sig { returns(KubeDSL::DSL::V1::TCPSocketAction) }
        def tcp_socket; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def termination_grace_period_seconds(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def timeout_seconds(val = nil); end
      end

      class ProjectedVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def default_mode(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::VolumeProjection))).returns(T::Array[KubeDSL::DSL::V1::VolumeProjection]) }
        def sources(elem_name = nil, &block); end
      end

      class QuobyteVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def group(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def registry(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def tenant(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def user(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume(val = nil); end
      end

      class RBDPersistentVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def image(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def keyring(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def monitors(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def pool(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def user(val = nil); end
      end

      class RBDVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def image(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def keyring(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def monitors(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def pool(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::LocalObjectReference) }
        def secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def user(val = nil); end
      end

      class ReplicationController < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::ReplicationControllerSpec) }
        def spec; end

        sig { returns(KubeDSL::DSL::V1::ReplicationControllerStatus) }
        def status; end
      end

      class ReplicationControllerCondition < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def last_transition_time(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def message(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def reason(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def status(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class ReplicationControllerList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ReplicationController))).returns(T::Array[KubeDSL::DSL::V1::ReplicationController]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class ReplicationControllerSpec < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def min_ready_seconds(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def replicas(val = nil); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def selector(&block); end

        sig { returns(KubeDSL::DSL::V1::PodTemplateSpec) }
        def template; end
      end

      class ReplicationControllerStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def available_replicas(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ReplicationControllerCondition))).returns(T::Array[KubeDSL::DSL::V1::ReplicationControllerCondition]) }
        def conditions(elem_name = nil, &block); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def fully_labeled_replicas(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def observed_generation(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def ready_replicas(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def replicas(val = nil); end
      end

      class ResourceFieldSelector < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def container_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def divisor(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def resource(val = nil); end
      end

      class ResourceQuota < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::ResourceQuotaSpec) }
        def spec; end

        sig { returns(KubeDSL::DSL::V1::ResourceQuotaStatus) }
        def status; end
      end

      class ResourceQuotaList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ResourceQuota))).returns(T::Array[KubeDSL::DSL::V1::ResourceQuota]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class ResourceQuotaSpec < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def hard(&block); end

        sig { returns(KubeDSL::DSL::V1::ScopeSelector) }
        def scope_selector; end

        sig { params(val: T.nilable(String)).returns(String) }
        def scopes(val = nil); end
      end

      class ResourceQuotaStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def hard(&block); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def used(&block); end
      end

      class ResourceRequirements < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def limits(&block); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def requests(&block); end
      end

      class ScaleIOPersistentVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def gateway(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def protection_domain(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SecretReference) }
        def secret_ref; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def ssl_enabled(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def storage_mode(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def storage_pool(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def system(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_name(val = nil); end
      end

      class ScaleIOVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def gateway(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def protection_domain(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::LocalObjectReference) }
        def secret_ref; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def ssl_enabled(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def storage_mode(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def storage_pool(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def system(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_name(val = nil); end
      end

      class ScopeSelector < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ScopedResourceSelectorRequirement))).returns(T::Array[KubeDSL::DSL::V1::ScopedResourceSelectorRequirement]) }
        def match_expressions(elem_name = nil, &block); end
      end

      class ScopedResourceSelectorRequirement < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def operator(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def scope_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def values(val = nil); end
      end

      class SELinuxOptions < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def level(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def role(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def user(val = nil); end
      end

      class SeccompProfile < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def localhost_profile(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class Secret < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def data(&block); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def immutable(val = nil); end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def string_data(&block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class SecretEnvSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def optional(val = nil); end
      end

      class SecretKeySelector < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def key(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def optional(val = nil); end
      end

      class SecretList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Secret))).returns(T::Array[KubeDSL::DSL::V1::Secret]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class SecretProjection < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::KeyToPath))).returns(T::Array[KubeDSL::DSL::V1::KeyToPath]) }
        def items(elem_name = nil, &block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def optional(val = nil); end
      end

      class SecretReference < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def namespace(val = nil); end
      end

      class SecretVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def default_mode(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::KeyToPath))).returns(T::Array[KubeDSL::DSL::V1::KeyToPath]) }
        def items(elem_name = nil, &block); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def optional(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def secret_name(val = nil); end
      end

      class SecurityContext < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def allow_privilege_escalation(val = nil); end

        sig { returns(KubeDSL::DSL::V1::Capabilities) }
        def capabilities; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def privileged(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def proc_mount(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only_root_filesystem(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def run_as_group(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def run_as_non_root(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def run_as_user(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SELinuxOptions) }
        def se_linux_options; end

        sig { returns(KubeDSL::DSL::V1::SeccompProfile) }
        def seccomp_profile; end

        sig { returns(KubeDSL::DSL::V1::WindowsSecurityContextOptions) }
        def windows_options; end
      end

      class Service < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { returns(KubeDSL::DSL::V1::ServiceSpec) }
        def spec; end

        sig { returns(KubeDSL::DSL::V1::ServiceStatus) }
        def status; end
      end

      class ServiceAccount < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def automount_service_account_token(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::LocalObjectReference))).returns(T::Array[KubeDSL::DSL::V1::LocalObjectReference]) }
        def image_pull_secrets(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
        def metadata; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ObjectReference))).returns(T::Array[KubeDSL::DSL::V1::ObjectReference]) }
        def secrets(elem_name = nil, &block); end
      end

      class ServiceAccountList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ServiceAccount))).returns(T::Array[KubeDSL::DSL::V1::ServiceAccount]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class ServiceAccountTokenProjection < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def audience(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def expiration_seconds(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def path(val = nil); end
      end

      class ServiceList < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::Service))).returns(T::Array[KubeDSL::DSL::V1::Service]) }
        def items(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::Meta::V1::ListMeta) }
        def metadata; end
      end

      class ServicePort < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def app_protocol(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def node_port(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def port(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def protocol(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def target_port(val = nil); end
      end

      class ServiceSpec < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def allocate_load_balancer_node_ports(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def cluster_ip(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def cluster_i_ps(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def external_i_ps(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def external_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def external_traffic_policy(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def health_check_node_port(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def internal_traffic_policy(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def ip_families(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def ip_family_policy(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def load_balancer_class(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def load_balancer_ip(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def load_balancer_source_ranges(val = nil); end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::ServicePort))).returns(T::Array[KubeDSL::DSL::V1::ServicePort]) }
        def ports(elem_name = nil, &block); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def publish_not_ready_addresses(val = nil); end

        sig { params(block: T.nilable(T.proc.void)).returns(::KubeDSL::KeyValueFields) }
        def selector(&block); end

        sig { params(val: T.nilable(String)).returns(String) }
        def session_affinity(val = nil); end

        sig { returns(KubeDSL::DSL::V1::SessionAffinityConfig) }
        def session_affinity_config; end

        sig { params(val: T.nilable(String)).returns(String) }
        def type(val = nil); end
      end

      class ServiceStatus < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::Meta::V1::Condition))).returns(T::Array[KubeDSL::DSL::Meta::V1::Condition]) }
        def conditions(elem_name = nil, &block); end

        sig { returns(KubeDSL::DSL::V1::LoadBalancerStatus) }
        def load_balancer; end
      end

      class SessionAffinityConfig < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::ClientIPConfig) }
        def client_ip; end
      end

      class StorageOSPersistentVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::ObjectReference) }
        def secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_namespace(val = nil); end
      end

      class StorageOSVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { returns(KubeDSL::DSL::V1::LocalObjectReference) }
        def secret_ref; end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_namespace(val = nil); end
      end

      class Sysctl < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def value(val = nil); end
      end

      class Taint < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def effect(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def key(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def time_added(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def value(val = nil); end
      end

      class TCPSocketAction < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def host(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def port(val = nil); end
      end

      class Toleration < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def effect(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def key(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def operator(val = nil); end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def toleration_seconds(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def value(val = nil); end
      end

      class TopologySelectorLabelRequirement < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def key(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def values(val = nil); end
      end

      class TopologySelectorTerm < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(elem_name: T.nilable(Symbol), block: T.nilable(T.proc.returns(KubeDSL::DSL::V1::TopologySelectorLabelRequirement))).returns(T::Array[KubeDSL::DSL::V1::TopologySelectorLabelRequirement]) }
        def match_label_expressions(elem_name = nil, &block); end
      end

      class TopologySpreadConstraint < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::Meta::V1::LabelSelector) }
        def label_selector; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def max_skew(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def topology_key(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def when_unsatisfiable(val = nil); end
      end

      class TypedLocalObjectReference < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def api_group(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def kind(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end
      end

      class Volume < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
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

      class VolumeDevice < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def device_path(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end
      end

      class VolumeMount < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def mount_path(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def mount_propagation(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def read_only(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def sub_path(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def sub_path_expr(val = nil); end
      end

      class VolumeNodeAffinity < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::NodeSelector) }
        def required; end
      end

      class VolumeProjection < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::ConfigMapProjection) }
        def config_map; end

        sig { returns(KubeDSL::DSL::V1::DownwardAPIProjection) }
        def downward_api; end

        sig { returns(KubeDSL::DSL::V1::SecretProjection) }
        def secret; end

        sig { returns(KubeDSL::DSL::V1::ServiceAccountTokenProjection) }
        def service_account_token; end
      end

      class VsphereVirtualDiskVolumeSource < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def fs_type(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def storage_policy_id(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def storage_policy_name(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def volume_path(val = nil); end
      end

      class WeightedPodAffinityTerm < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { returns(KubeDSL::DSL::V1::PodAffinityTerm) }
        def pod_affinity_term; end

        sig { params(val: T.nilable(Integer)).returns(Integer) }
        def weight(val = nil); end
      end

      class WindowsSecurityContextOptions < ::KubeDSL::DSLObject
        sig { returns(T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]) }
        def serialize; end

        sig { returns(Symbol) }
        def kind_sym; end

        sig { params(val: T.nilable(String)).returns(String) }
        def gmsa_credential_spec(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def gmsa_credential_spec_name(val = nil); end

        sig { params(val: T.nilable(T::Boolean)).returns(T::Boolean) }
        def host_process(val = nil); end

        sig { params(val: T.nilable(String)).returns(String) }
        def run_as_user_name(val = nil); end
      end
    end
  end
end
