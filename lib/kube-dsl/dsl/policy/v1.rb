# typed: strict
module KubeDSL::DSL::Policy::V1
  autoload :Eviction, 'kube-dsl/dsl/policy/v1/eviction'
  autoload :PodDisruptionBudget, 'kube-dsl/dsl/policy/v1/pod_disruption_budget'
  autoload :PodDisruptionBudgetList, 'kube-dsl/dsl/policy/v1/pod_disruption_budget_list'
  autoload :PodDisruptionBudgetSpec, 'kube-dsl/dsl/policy/v1/pod_disruption_budget_spec'
  autoload :PodDisruptionBudgetStatus, 'kube-dsl/dsl/policy/v1/pod_disruption_budget_status'
end
