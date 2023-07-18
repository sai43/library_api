class Book < ApplicationRecord
  belongs_to :library, foreign_key: 'library_id', optional: false
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: false
  belongs_to :checked_out_by, class_name: 'User', foreign_key: 'checked_out_by_id', optional: true

  alias_attribute :status, :available
  
  validates :title, presence: true
  validates :library_id, presence: true
  validates :author_id, presence: true

  private 

  def checked_out?
    checked_out
  end

end
