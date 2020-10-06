require 'rails_helper'

RSpec.describe Book, type: :model do
  it '有効なモデルを持つこと' do
    book = Book.new(
      title: '白鯨',
      date_of_publication: '2020/09/08'
    )
    expect(book).to be_valid
  end

  it '出版日がないと無効な状態であること' do
    book = Book.new(
      title: '変身',
      date_of_publication: nil
    )
    book.valid?
    expect(book.errors[:date_of_publication]).to include("can't be blank")
  end

  it 'タイトルがないと無効な状態であること' do
    book = Book.new(
      title: nil,
      date_of_publication: '2020/10/05'
    )
    book.valid?
    expect(book.errors[:title]).to include("can't be blank")
  end
end
