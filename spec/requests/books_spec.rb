require 'rails_helper'

describe 'Books API', type: :request do
  it 'return all books' do
    FactoryBot.create(:book, title: '1984', author: 'George Orvell')
    FactoryBot.create(:book, title: 'The time machine', author: 'H.G Wells')


    get '/api/v1/books'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(2)
  end
end