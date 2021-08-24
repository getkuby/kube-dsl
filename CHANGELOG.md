## 0.6.0
* Improve path and namespace handling in generator.

## 0.5.1
* Support Ruby 2.7
  - Stop using the `RubyToken` class from irb, which doesn't exist anymore.
* Fix bug causing `NoMethodError`s if the type field contains a single string and not an array.

## 0.5.0
* Recursively validate.
* Add README.

## 0.4.0
* Add validations.
  - You can now call `#valid?` and `#validate` methods on DSL objects.
* Fixed several bad inflections causing Ruby keywords to appear in unexpected places, namely in `#serialize` methods.
* Prevent JSON schema "$" variables (eg. "$ref") from being added as fields.

## 0.3.0
* Introduce the `key_value_field` method to simplify creating key/value fields.
* Add `#merge` and `#merge!` methods to anything that includes or extends `ValueFields`.

## 0.2.0
* Treat bare array fields as value fields.
  - When specifying `array_field(:foo)`, you would get a doubly-nested array if you filled in the value via a block, eg: `foo { [1, 2, 3] }`.
  - This fix means you can now write `foo [1, 2, 3]` for a "bare" array.

## 0.1.0
* Birthday!
