require 'rails_helper'

RSpec.describe "Libraries", type: :request do

  describe "GET /index" do
    context "#index (GET /libraries.json)" do 

      it "should fetch all libraries" do         
        get "/libraries"
        expect(response).to have_http_status(:success)
      end 
    end 
  end
end
