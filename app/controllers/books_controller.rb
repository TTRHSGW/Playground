class BooksController < ApplicationController
  before_action :set_book, only: %i[edit show update]

  def index; end

  def new; end

  def edit; end

  def update; end

  def create
    book = Book.new(book_params)

    if book.save
      redirect_to book, notice: '登録しました'
    else
      render :new, notice: '登録できませんでした', status: :no_content
    end
  end

  def show; end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :date_of_publication)
  end
end
