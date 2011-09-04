class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    # This method intentionally left blank.
  end
end
