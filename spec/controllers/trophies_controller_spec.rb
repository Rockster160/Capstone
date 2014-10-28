require 'rails_helper'

RSpec.describe TrophiesController, :type => :controller do

  describe "GET checker" do
    it "returns http success" do
      get :checker
      expect(response).to be_success
    end
  end

end
