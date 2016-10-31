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

    describe "POST #create" do
        context "when is successfully created" do
            before(:each) do
                @user_attributes = FactoryGirl.attributes_for :user
                post :create, { user: @user_attributes }, format: :json
            end

            it "renders the json representation for the user just created" do
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response[:email]).to eql @user_attributes[:email]
            end

            it "responds with a 201" do
                expect(response.status).to eql 201
            end
        end

        context "when is not created" do
            before(:each) do
                @invalid_user_attributes = {
                    password: "testpass",
                    password_confirmation: "testpass"
                }
                post :create, { user: @invalid_user_attributes }, format: :json
            end

            it "renders an errors json" do
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response.keys).to include :errors
            end

            it "renders the json errors on why the user could not be created" do
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response[:errors][:email]).to include "can't be blank"
            end

            it "responds with 422" do
                expect(response.status).to eql 422
            end
        end
    end
end
