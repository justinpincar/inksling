class HomeController < ApplicationController
  def index
    # This method intentionally left blank.
  end

  def authenticate
    @user = User.new
  end
end
