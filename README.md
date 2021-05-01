## kube-dsl
A Ruby DSL for defining Kubernetes resources.

## What is this thing?

KubeDSL provides a [domain-specific language](https://en.wikipedia.org/wiki/Domain-specific_language) for defining Kubernetes resource objects in Ruby. Why would you want to do this? Well,

1. I think Ruby code is easier to read than YAML.
1. every property is a Ruby method, meaning Ruby will blow up if you try to configure the object the wrong way.
1. doing so follows the principle of [infrastructure as code](https://en.wikipedia.org/wiki/Infrastructure_as_code).
1. validations are built-in.

## Installation

Either run `gem install kube-dsl` or add it to your Gemfile:

```ruby
gem 'kube-dsl', '< 1'
```

## Usage

KubeDSL directly mirrors the fields and nesting structure of each Kubernetes YAML (or JSON) object. Ruby fields are snake_cased while Kubernetes fields are camelCased. Let's take a look at a short example where we define a Namespace:

```ruby
ns = KubeDSL.namespace do
  metadata do
    name 'my-namespace'
  end
end
```

In the example above, we've defined a `KubeDSL::DSL::V1::Namespace` object and assigned it to a local variable called `ns`. Now let's convert it into a YAML string and print it out:

```ruby
# ---
# apiVersion: v1
# kind: Namespace
# metadata:
#   name: foo
puts ns.to_resource.to_yaml
```

The `#to_resource` method returns an instance of the `KubeDSL::Resource` class while `#to_yaml` converts the resource into a YAML string. Pretty cool, eh? See the next few sections for examples creating other types of common Kubernetes objects.

### ServiceAccount Example

Note how key/value pairs are added to the `labels` field.

```ruby
KubeDSL.service_account do
  metadata do
    name 'my-service-account'
    namespace 'my-namespace'

    labels do
      add :app, 'my-app'
      add :role, 'web'
    end
  end
end
```

### Service Example

```ruby
KubeDSL.service do
  metadata do
    name 'my-service'
    namespace 'my-namespace'

    labels do
      add :app, 'my-app'
      add :role, 'web'
    end
  end

  spec do
    type 'NodePort'

    selector do
      add :app, 'my-app'
      add :role, 'web'
    end

    port do
      name 'http'
      port 3000
      protocol 'TCP'
      target_port 'http'
    end
  end
end
```

### Deployment Example

Note:

1. Elements of arrays can be given names (see the use of the `#container` method below) so they can be easily retrieved and/or modified later.
1. The example below shows how to add config maps and secrets to a deployment via references.

```ruby
KubeDSL.deployment do
  metadata do
    name 'my-deployment'
    namespace 'my-namespace'

    labels do
      add :app, 'my-app'
      add :role, 'web'
    end
  end

  spec do
    replicas 2

    selector do
      match_labels do
        add :app, 'my-app'
        add :role, 'web'
      end
    end

    strategy do
      type 'RollingUpdate'

      rolling_update do
        max_surge '25%'
        max_unavailable 1
      end
    end

    template do
      metadata do
        labels do
          add :app, 'my-app'
          add :role, 'web'
        end
      end

      spec do
        # elements of arrays can be given names (:web in this case) so they can be
        # easily retrieved and/or modified later
        container(:web) do
          name 'my-web-container'
          image_pull_policy 'IfNotPresent'

          port do
            container_port 3000
            name 'http'
            protocol 'TCP'
          end

          env_from do
            config_map_ref do
              name 'my-config-map'
            end
          end

          env_from do
            secret_ref do
              name 'my-secrets'
            end
          end

          readiness_probe do
            success_threshold 1
            failure_threshold 2
            initial_delay_seconds 15
            period_seconds 3
            timeout_seconds 1

            http_get do
              path '/healthz'
              port 3000
              scheme 'HTTP'
            end
          end
        end

        image_pull_secret do
          name 'my-registry-secret'
        end
      end

      restart_policy 'Always'
      service_account_name 'my-service-account'
    end
  end
end
```

### Ingress Example

NOTE: the example below includes an annotation that is specific to the Nginx ingress controller.

```ruby
KubeDSL::DSL::Extensions::V1beta1::Ingress.new do
  metadata do
    name 'my-ingress'
    namespace 'my-namespace'

    annotations do
      add :'kubernetes.io/ingress.class', 'nginx'
    end
  end

  spec do
    rule do
      host 'my-website.com'

      http do
        path do
          path '/'

          backend do
            service_name 'my-service'
            service_port 80
          end
        end
      end
    end
  end
end
```

### ConfigMap Example

```ruby
KubeDSL.config_map do
  metadata do
    name 'my-config-map'
    namespace 'my-namespace'
  end

  data do
    add :MY_VAR, 'value'
    add :MY_OTHER_VAR, 'value'
  end
end
```

### Secret Example

```ruby
KubeDSL.secret do
  metadata do
    name 'my-secrets'
    namespace 'my-namespace'
  end

  type 'Opaque'

  data do
    add :MY_SECRET, 'value'
  end
end
```

## Code Generation

All the Ruby code present in KubeDSL is generated from the Kubernetes JSON schema available [here](https://github.com/instrumenta/kubernetes-json-schema). Run the following rake task to regenerate:

```bash
bundle exec rake generate
```

## Authors

* Cameron C. Dutro: http://github.com/camertron

## License

Licensed under the MIT license.
