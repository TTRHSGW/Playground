class BooksController < ApplicationController
  before_action :set_book, only: %i[edit show update]

  def index
    @books = Book.all
  end

  def show; end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: '登録しました'
    else
      flash.now[:danger] = '登録できませんでした'
      render :new
    end
  end

  def edit; end

  def update; end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :date_of_publication)
  end
end
