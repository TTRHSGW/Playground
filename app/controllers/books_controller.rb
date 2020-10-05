class BooksController < ApplicationController
  before_action :set_book, only: %i[edit show update]

  def index
  end

  def new
  end

  def edit
  end

  def show
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :date_of_publication)
  end
end
