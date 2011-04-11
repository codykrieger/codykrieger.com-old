  require 'spec_helper'
  include Devise::TestHelpers

  describe Admin::DashboardController do
    before(:each) do
      @user = @user ||=Factory.create(:admin)
      sign_in @user
    end

    describe "GET 'index'" do
      it "should be successful" do
        get 'index'
        response.should be_success
      end
    end

  end

