class Writer
  include Mongoid::Document
  field :code, type: String
  field :name, type: String
  field :book, type: String
  field :address, type: Integer
  field :line, type:Integer

end
