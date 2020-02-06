module KubeDSL::DSL::Rbac
  autoload :AggregationRule, 'kube-dsl/dsl/rbac/aggregation_rule'
  autoload :ClusterRole, 'kube-dsl/dsl/rbac/cluster_role'
  autoload :ClusterRoleBinding, 'kube-dsl/dsl/rbac/cluster_role_binding'
  autoload :ClusterRoleBindingList, 'kube-dsl/dsl/rbac/cluster_role_binding_list'
  autoload :ClusterRoleList, 'kube-dsl/dsl/rbac/cluster_role_list'
  autoload :PolicyRule, 'kube-dsl/dsl/rbac/policy_rule'
  autoload :Role, 'kube-dsl/dsl/rbac/role'
  autoload :RoleBinding, 'kube-dsl/dsl/rbac/role_binding'
  autoload :RoleBindingList, 'kube-dsl/dsl/rbac/role_binding_list'
  autoload :RoleList, 'kube-dsl/dsl/rbac/role_list'
  autoload :RoleRef, 'kube-dsl/dsl/rbac/role_ref'
  autoload :Subject, 'kube-dsl/dsl/rbac/subject'
end
