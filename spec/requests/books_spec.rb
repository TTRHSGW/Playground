require 'rails_helper'

RSpec.describe 'Books', type: :request do
  describe 'GET /books' do
    it 'index.htmlが読み込まれること' do
      get books_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /books/new' do
    it 'new.html.erbが読み込まれること' do
      get new_book_path
      expect(response.body).to include('Books#new')
    end
  end

  describe 'POST /books' do
    context 'Bookが有効な時' do
      it 'Bookが登録されること' do
        expect do
          post books_path, params: { book: { title: 'リーダブルコード', date_of_publication: '2020/10/6' } }
        end.to change(Book, :count).by(1)
        expect(response).to have_http_status(302)
      end
    end

    context 'Bookが無効な時' do
      it 'Bookが登録されないこと' do
        expect do
          post books_path, params: { book: { title: nil, date_of_publication: '2020/10/6' } }
        end.to change(Book, :count).by(0)
        expect(response).to have_http_status(204)
      end
    end
  end
end
