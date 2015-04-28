require 'rails_helper'

describe UsersController do
  render_views

  let(:user) { FactoryGirl.create(:user) }
  let(:user_params) { FactoryGirl.attributes_for(:user) }
  let(:invalid_params) { user_params.merge(password: 'newpassword', password_confirmation: 'wrongpassword') }
  let(:logged_in_session) { { user_id: user.id } }

  describe "GET 'edit'" do
    it "redirects if there is no current user" do
      get :edit
      expect(response).to be_redirect
    end

    it "edits the current user" do
      get :edit, {}, logged_in_session
      expect(response).to be_success
    end
  end

  describe "PUT 'update'" do
    it "redirects if there is no current user" do
      put :update, {user: user_params.merge(first_name: "Alvarez")}
      expect(response).to be_redirect
    end

    describe "with valid params" do
      describe "when changing the email" do
        before(:each) do
          allow(controller).to receive(:current_user).and_return(user)
        end


      end

      describe "from html" do
        before(:each) do
          allow(controller).to receive(:current_user).and_return(user)
        end

        it "updates the user" do
          expect {
            put :update, {user: user_params.merge(first_name: "Alvarez")}, logged_in_session
          }.to change(user, :first_name)
        end

        it "redirects the user" do
          put :update, {user: user_params}, logged_in_session
          expect(response).to be_redirect
        end
      end

      describe "from json" do
        before(:each) do
          allow(controller).to receive(:current_user).and_return(user)
        end

        it "updates the user" do
          expect {
            put :update, {user: user_params.merge(first_name: "Alvarez"), format: 'json'}, logged_in_session
          }.to change(user, :first_name)
        end
      end
    end

    describe "with invalid params" do
      before(:each) do
        allow(controller).to receive(:current_user).and_return(user)
      end

      describe "from html" do
        before(:each) do
          put :update, {user: invalid_params}, logged_in_session
        end

        it "renders the edit page" do
          expect(response).to render_template('edit')
          expect(response).to be_success
        end

        it "sets the errors" do
          expect(user.errors[:password_confirmation].size).to eq(1)
        end
      end

      describe "from json" do
        before(:each) do
          put :update, {user: invalid_params, format: 'json'}, logged_in_session
        end

        it "returns a 422" do
          expect(response.code).to eq('422')
        end

        it "includes the errors in the json" do
          expect(user.errors[:password_confirmation].size).to eq(1)
          expect(response.body).to match(/doesn't match Password/i)
        end
      end
    end
  end
end

