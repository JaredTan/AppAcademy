require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
     it "renders the new template" do
       get :new, {}
       expect(response).to render_template("new")
     end
   end

   describe "POST #create" do
     context "with invalid params" do
       it "validates the presence of the user's email and password" do
         post :create, user: {email: 'hello@gmail.com', password: nil}
         expect(response).to render_template('new')

       it "validates that the password is at least 6 characters long" do 
         post :create, user: {email: 'hello@gmail.com', password: 'hello'}
         expect(response).to render_template('new')
     end

     context "with valid params" do
       it "redirects user to bands index on success"
        post :create, user: {email: 'hello@gmail.com', password: 'potatoesareyum'}
        expect(response).to redirect_to(new_session_url)
     end

   end
end
