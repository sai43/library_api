class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :available

  belongs_to :library, serializer: LibrarySerializer
  belongs_to :author, record_type: :user, serializer: UserSerializer
  belongs_to :checked_out_by, record_type: :user, serializer: UserSerializer
end
