require 'spec_helper'

describe UsersController do
    describe "GET #show" do
    before(:each) do
        @user = FactoryGirl.create :user
        get :show, id: @user.id, format: :json
    end

    it "returns the information about a reporter on a hash" do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql @user.email
    end

    it "responds with a 200" do
        expect(response.status).to eql 200
    end
  end
end
