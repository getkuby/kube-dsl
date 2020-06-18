## 0.3.0
* Introduce the `key_value_field` method to simplify creating key/value fields.
* Add `#merge` and `#merge!` methods to anything that includes or extends `ValueFields`.

## 0.2.0
* Treat bare array fields as value fields.
  - When specifying `array_field(:foo)`, you would get a doubly-nested array if you filled in the value via a block, eg: `foo { [1, 2, 3] }`.
  - This fix means you can now write `foo [1, 2, 3]` for a "bare" array.

## 0.1.0
* Birthday!
