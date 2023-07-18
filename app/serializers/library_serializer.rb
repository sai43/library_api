class LibrarySerializer
  include JSONAPI::Serializer

  attr_accessor :id, :name, :address

  has_many :books

end
