class HomeController < ApplicationController
  def index
    @collaberations = Collaberation.all
  end
end
