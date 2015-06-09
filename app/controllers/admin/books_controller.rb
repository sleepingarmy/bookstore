class Admin::BooksController < ApplicationController
  before_action :find_book, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_admin

  def index #get - make a view file
    @books = Book.all
    @params = params
  end

  def create #post - fancy logic to save data
    @book = Book.new(book_params)
    if @book.save
      redirect_to(admin_books_path)
    else
      render :new
    end

  end

  def new #get - make view file to display page
    @book = Book.new
  end

  def edit #get
    
  end

  def show #get
  end

  def update #put
    if @book.update(book_params)
      redirect_to(admin_books_path)
    else
      render :edit
    end
  end

  def destroy #delete
    @book.destroy
    redirect_to(admin_books_path)
  end

  private

  #strong params
  def book_params
    params.require(:book).permit(:title, :genre, :author, :date_published)
  end

  def find_book
    @book = Book.find(params[:id])
  end

end