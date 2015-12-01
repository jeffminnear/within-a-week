require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:my_user)   { create(:user) }

  describe "GET #show" do
    before do
      my_user.confirm
      sign_in(my_user)
    end

    it "returns http success" do
      get :show, {id: my_user.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: my_user.id}
      expect(response).to render_template(:show)
    end

    it "assigns my_user to @user" do
      get :show, {id: my_user.id}
      expect(assigns(:user)).to eq(my_user)
    end
  end

end
