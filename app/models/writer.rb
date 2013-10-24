class Writer
  include Mongoid::Document
  field :name, type: String
  field :book, type: String
  field :address, type: Integer
end
