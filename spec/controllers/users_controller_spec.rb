require "rails_helper"
RSpec.describe UsersController, type: :controller do
  let(:user) do
    build(:user)
  end
  context "signup" do
    it "render signup template" do
      get :signup
      expect(response).to render_template("signup")
    end
  end

  context "signin" do
    it "render signin template" do
      get :signin
      expect(response).to render_template("signin")
    end
  end
end
