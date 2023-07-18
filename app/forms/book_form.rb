class BookForm < BaseForm

    attr_reader :book

    validate :validate_library_id, :validate_author_id 

    def initialize(params = {})
        @params = params 
    end

    def save 
      if valid?
       save_book
      end
    end
    
    def save_book 
      ActiveRecord::Base.transaction do
        @book = Book.new(@params)
        @book.save!
      end
    end
    private 

    def validate_library_id
      errors.add(:base, 'library_id param is missing.') unless @params[:library_id]
    end

    def validate_author_id
      errors.add(:base, 'author_id param is missing.') unless @params[:author_id]
    end

end
