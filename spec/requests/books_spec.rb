require 'rails_helper'

RSpec.describe "Books", type: :request do

  let(:library) { create(:library) }
  let(:author) { create(:author) }

  let (:book_params) do
    {
      title: "Lebara magnner",
      available: true,
      library_id: library.id,
      author_id: author.id
    }
  end

  describe "GET /books without library_id" do 
    it "should returns library_id param missing" do 
      get "/books"
      expect(response).to have_http_status(:unprocessable_entity)
      response_data = JSON.parse(response.body)
      expect(response_data['message']).to eq("library_id param is missing.")
    end
  end

  describe "GET /books with library_id" do 
    it "should returns library_id param missing" do 
      get "/books?library_id=1"
      expect(response).to have_http_status(:success)
      response_data = JSON.parse(response.body)
      expect(response_data['data'].count).to be >=0
    end
  end

  describe "POST /books with invalid request params" do 
    it "should not create the book record in DB" do 
      post "/books", params: book_params.to_json
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

end
