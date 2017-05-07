require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  # let(:user){ User.create(id: 1, name: "test", email:"test@test.test", password: "test", password_confirmation: "test") }

  describe "#logged_in?" do
    it "returns false if a user is not logged in" do
      session[:user_id] = nil
      expect(helper.logged_in?).to be(false)
    end

    it "returns true if a user is logged in" do
      session[:user_id] = 1
      expect(helper.logged_in?).to be(true)
    end
  end

  describe "current_user" do
    it "returns a user" do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      expect(current_user).to eq(user)
    end

    it "returns nil if no user is present" do
      session[:user_id] = nil
      expect(current_user).to be(nil)
    end
  end
end
