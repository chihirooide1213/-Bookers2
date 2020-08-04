class BooksController < ApplicationController
before_action :authenticate_user!
  def index
  	@book = Book.new
  	@books = Book.all
    @user = current_user
  end

  def show
  	@book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
    @book_comment = BookComment.new
    @book_comments = @book.book_comments
    # comment= Comment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
       redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      render action: :edit
    end
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    @user = current_user
    if @book.save
      flash[:notice] = "Book was successfully created."
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
