require 'securerandom'

module KubeDSL
  module ValueFields
    def value_fields(*fields)
      fields.each { |field| value_field(field) }
    end

    def value_field(field, default: nil)
      define_method(field) do |*args|
        if args.empty?
          instance_variable_get(:"@#{field}") || (
            default.respond_to?(:call) ? default.call : default
          )
        else
          instance_variable_set(:"@#{field}", args.first)
        end
      end
    end

    def object_field(field, &field_block)
      define_method(field) do |*args, &block|
        ivar = :"@#{field}"
        val = instance_variable_get(ivar)

        unless val
          val = field_block.call(*args)
          instance_variable_set(ivar, val)
        end

        val.instance_exec(&block) if block
        val
      end
    end

    def array_field(field, accessor = nil, &field_block)
      accessor ||= Inflector.pluralize(field.to_s).to_sym

      define_method(field) do |elem_name = nil, &block|
        ivar = :"@#{accessor}"
        arr = instance_variable_get(ivar)

        # use a hash so elements can be named and modified later
        unless arr
          arr = {}
          instance_variable_set(ivar, arr)
        end

        if elem_name && elem = arr[elem_name]
          elem.instance_eval(&block) if block
          elem
        else
          if field_block
            new_val = field_block.call
            new_val.instance_eval(&block) if block
          else
            new_val = block.call if block
          end

          arr[elem_name || SecureRandom.hex] = new_val
          new_val
        end
      end

      define_method(accessor) do
        ivar = :"@#{accessor}"
        arr = instance_variable_get(ivar)

        unless arr
          arr = {}
          instance_variable_set(ivar, arr)
        end

        arr.values
      end
    end
  end
end
