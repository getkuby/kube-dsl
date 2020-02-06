module KubeDSL::DSL::Authentication
  autoload :BoundObjectReference, 'kube-dsl/dsl/authentication/bound_object_reference'
  autoload :TokenRequest, 'kube-dsl/dsl/authentication/token_request'
  autoload :TokenRequestSpec, 'kube-dsl/dsl/authentication/token_request_spec'
  autoload :TokenRequestStatus, 'kube-dsl/dsl/authentication/token_request_status'
  autoload :TokenReview, 'kube-dsl/dsl/authentication/token_review'
  autoload :TokenReviewSpec, 'kube-dsl/dsl/authentication/token_review_spec'
  autoload :TokenReviewStatus, 'kube-dsl/dsl/authentication/token_review_status'
  autoload :UserInfo, 'kube-dsl/dsl/authentication/user_info'
end
