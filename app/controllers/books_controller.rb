class BooksController < ApplicationController

  before_action :prepare_library, only: %i[ index create]
  before_action :prepare_author, only: %i[ create ]
  before_action :set_book, only: %i[ show update destroy ]

  
  # GET /books
  def index
    @books = Book.where(library_id: @library.id)

    render json: serializer.new(@books).serializable_hash
  end

  # GET /books/1
  def show
    render json: serializer.new(@book).serializable_hash
  end

  # POST /books
  def create
    @form = BookForm.new(book_params)
    if @form.save
      render json: serializer.new(@form.book).serializable_hash
    else
      render json: @form.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: serializer.new(@book).serializable_hash
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      @book_params = params.require(:book).permit(:title, :available, :library_id, :author_id, :checked_out_by_id)
      @book_params[:author_id] = @author.id if params[:action].eql?('create')
      @book_params[:library_id] = @library.id if params[:action].eql?('index') || params[:action].eql?('create')
      @book_params
    end

    def prepare_library
      unless params[:library_id]
        render json: { message: 'library_id param is missing.'}, status: :unprocessable_entity and return 
      end
      @library = Library.find_by(id: params[:library_id])
    end

    def prepare_author
      unless params[:author_id]
        render json: { message: 'author_id param is missing.'}, status: :unprocessable_entity and return 
      end
      @author = User.find_by(id: params[:author_id])
    end

    def serializer
      BookSerializer
    end
end
