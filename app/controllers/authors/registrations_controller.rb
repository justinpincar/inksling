class Authors::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource_or_scope)
    dashboard_index_path
  end
end
