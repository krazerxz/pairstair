require "rails_helper"

describe HomeController, type: :controller do
  describe "#GET index" do
    it "fetches the collaberations" do
      expect(Collaberation).to receive(:all)
      get :index
    end
  end
end
