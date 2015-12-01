require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:my_user)   { create(:user) }

  describe "GET #about" do
    before do
      my_user.confirm
      sign_in(my_user)
    end

    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

end
