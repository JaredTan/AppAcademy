class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index # your code here
  end

  def new
    render :new# your code here
  end

  def create
    Book.new(book_params)
    redirect_to books_url
    # your code here
  end

  def show
    render :json => Book.find(params[:id])
  end

  def update
   book = Book.find(params[:id])
   if book.update_attributes(book_params)
     render :json => book
   else
     render :json => book.errors, :status => :unprocessable_entity
   end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    render json: book
  end

  private
  def book_params
    params.require(:book).permit(:id, :title, :author)
  end
end
