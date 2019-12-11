require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry.Types()

  Int    = Coercible::Integer
  Hash   = Coercible::Hash
  String = Coercible::String
  Array = Coercible::Array
end