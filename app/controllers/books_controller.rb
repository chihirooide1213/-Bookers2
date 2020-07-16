class BooksController < ApplicationController
  def index
  	@book = Book.new
  	@books = Book.all
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  end

  def create
  	@book = Book.new(book_params)
    if @book.save
       redirect_to book_path(@book.id)
    else
     render action: :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    	flash[:notice] ='Book was successfully destroyed.'
        redirect_to books_path
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
