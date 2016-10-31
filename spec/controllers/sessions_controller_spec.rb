require 'spec_helper'

describe SessionsController do
    # describe "POST #create" do

    #     before(:each) do
    #         @user = FactoryGirl.create :user
    #     end

    #     context "when the credentials are correct" do

    #         before(:each) do
    #             credentials = { email: @user.email, password: "testpass" }
    #             post :create, { session: credentials }, format: :json
    #         end

    #         it "returns the user record corresponding to the given credentials" do
    #             @user.reload
    #             expect(json_response[:auth_token]).to eql @user.auth_token
    #         end

    #         it "responds with a 200" do
    #             expect(response.status).to eql 200
    #         end
    #     end

    #     context "when the credentials are incorrect" do

    #         before(:each) do
    #             credentials = { email: @user.email, password: "invalidpassword" }
    #             post :create, { session: credentials }, format: :json
    #         end

    #         it "returns a json with an error" do
    #             expect(json_response[:errors]).to eql "Invalid email or password"
    #         end

    #         it "responds with a 422" do
    #             expect(response.status).to eql 422
    #         end
    #     end
    # end
end
