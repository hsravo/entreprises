class HomeController < ApplicationController
  def index
    @charity = current_charity
  end
end
