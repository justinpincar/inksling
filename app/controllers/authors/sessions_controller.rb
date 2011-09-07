class Authors::SessionsController < Devise::SessionsController
  before_filter :store_location, :only => :new

  def store_location
    session[:author_return_to] = params[:author_return_to] if params[:author_return_to].present?
  end

  protected

  def after_sign_in_path_for(resource_or_scope)
    dashboard_index_path
  end

  def after_sign_out_path_for(resource_or_scope)
    home_path
  end
end
