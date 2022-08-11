class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @allbook = Book.all
  end

  def create
    @book = Book.new(book_params)
    @allbook = Book.all
    if @book.save
      flash[:notice] = "Book was successfully updated"
      redirect_to book_path(@book)
    else
      render :index
    end
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "Book was successfully update."
       redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
       book = Book.find(params[:id])
       flash[:notice] = "Book was successfully destroy."
       book.destroy
       redirect_to contoroller: :books, action: :index
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
