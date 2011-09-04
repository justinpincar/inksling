class DashboardController < ApplicationController
  before_filter :authenticate_author!

  def index
    # This method intentionally left blank.
  end
end
