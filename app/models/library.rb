class Library < ApplicationRecord
    has_many :books

    validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }  
    validate :validate_book_limit

    private

    # Adjust the limit as per your requirement
    def validate_book_limit
      if books.size > 10 
        errors.add(:base, 'Library has reached the maximum book limit.')
      end
    end
end
