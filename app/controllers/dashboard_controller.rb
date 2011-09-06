class DashboardController < ApplicationController
  before_filter :authenticate_author!

  def index
    @inks = Ink.where("text IS NOT NULL AND author_id != ?", current_author.id).order("updated_at ASC").limit(5)
  end
end
